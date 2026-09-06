;----------------------------------------------------
; 【クイズで遊ぼう！】ローディングシステム (loading_scene.ks)
; STEP 8-⑤ 全体レイアウト・間隔 最終調整版
;----------------------------------------------------
*loading_start

; 1. ローディング画面の表示 (HTML/CSS)
[iscript]
const charaGifPath = 'data/fgimage/gif/loading_chara.gif';

$('body').append(`
  <div id="loading-overlay" style="position:fixed; top:0; left:0; width:100%; height:100%; background:#111; z-index:99999; display:flex; flex-direction:column; justify-content:center; align-items:center; color:#fff; font-family:sans-serif; user-select:none;">
    
    <!-- 1. NOW LOADING... (メインタイトル) -->
    <div style="
      font-size: 32px; 
      font-weight: 800; 
      color: #ffde59; 
      letter-spacing: 2px;
      text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.8), 0 0 10px rgba(255, 222, 89, 0.3); 
      margin-bottom: 12px;
    ">NOW LOADING...</div>
    
    <!-- 2. 走るミニキャラGIF (メインビジュアル：タイトルとゲージを繋ぐ位置へ配置) -->
    <div id="loading-chara-box" style="margin-bottom: 12px; text-align: center;">
      <img id="loading-chara-gif" src="${charaGifPath}" style="width: 100px; height: auto; margin: 0 auto; display: block;" alt="Loading..." />
    </div>

    <!-- 3. プログレスバー (進捗表示) -->
    <div style="
      width: 340px; 
      height: 24px; 
      border: 3px solid #fff; 
      padding: 3px; 
      border-radius: 15px; 
      background: rgba(0, 0, 0, 0.5); 
      box-shadow: 0 0 10px rgba(255, 255, 255, 0.2), inset 0 2px 4px rgba(0, 0, 0, 0.8);
      margin-bottom: 10px;
    ">
      <div id="loading-bar" style="
        width: 0%; 
        height: 100%; 
        background: linear-gradient(180deg, #5effd8 0%, #00c896 100%); 
        border-radius: 10px; 
        box-shadow: 0 0 8px rgba(0, 255, 204, 0.6), inset 0 1px 1px rgba(255, 255, 255, 0.8);
        transition: width 0.2s linear;
      "></div>
    </div>
    
    <!-- 4. 読み込み中テキスト (補助情報) -->
    <div id="loading-text" style="
      font-size: 13px; 
      color: #d0d7de; 
      letter-spacing: 1px; 
      text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.8); 
      font-weight: 500;
      height: 18px;
      line-height: 18px;
    ">データを読み込み中です... (0%)</div>

    <!-- エラー表示領域 (レイアウト崩れ防止用 fixed 化) -->
    <div id="loading-error" style="position: absolute; bottom: 20px; font-size: 14px; color: #ff4444; display:none;"></div>
  </div>
`);
[endscript]

; 2. 動的 preloadList 生成 ＆ プリロードエンジン (JS)
[iscript]
// --- [A. 重複排除用の素材登録ロジック] ---
const assetMap = new Map();

function addAsset(src, type, required = true) {
  if (!src) return;
  if (!assetMap.has(src)) {
    assetMap.set(src, { src: src, type: type, required: required });
  }
}

// --- [B. 確定データから必要なアセットを自動抽出] ---

// 1. 今回の難易度背景 (tf.current_bg)
if (tf.current_bg) {
  addAsset('./data/bgimage/' + tf.current_bg, 'image', true);
}

// 2. 直後再生BGM
addAsset('./data/bgm/bgm1.ogg', 'audio', true);

// 3. 直後〜クイズ本編で必須の共通UI画像
addAsset('./data/fgimage/UI/bar_hk.png', 'image', true);
addAsset('./data/fgimage/UI/gage.png', 'image', true);
addAsset('./data/fgimage/UI/time_cover.png', 'image', true);
addAsset('./data/fgimage/UI/heart1.png', 'image', true);
addAsset('./data/fgimage/UI/heart01.png', 'image', true);

// 4. 直後演出のキャラ画像・ボイス (存在する場合)
if (sf.selected_chara) {
  addAsset('./data/fgimage/zunda/' + sf.selected_chara + '_normal.png', 'image', false);
  if (tf.diff) {
    addAsset('./data/sound/voice/' + sf.selected_chara + '/welcome1_' + tf.diff + '.ogg', 'audio', false);
    addAsset('./data/sound/voice/' + sf.selected_chara + '/tutorial_voice1_' + tf.diff + '.ogg', 'audio', false);
  }
}

// 5. 今回選ばれた10問のアセット (tf.selected_questions)
if (tf.selected_questions && Array.isArray(tf.selected_questions)) {
  tf.selected_questions.forEach(q => {
    if (q.img) addAsset('./data/fgimage/' + q.img, 'image', true);
    if (q.sound) addAsset('./data/sound/' + q.sound, 'audio', false);
  });
}

// 抽出完了した配列（重複排除済み）
const preloadList = Array.from(assetMap.values());

// --- [C. プリロード＆実行パラメータ] ---
const MAX_CONCURRENT = 4;
const MIN_LOADING_TIME = 1000;

let loadedCount = 0;
let hasError = false;
let isFinished = false;
let fileIndex = 0;
const totalCount = preloadList.length;
const startTime = Date.now();

function updateUI(percent, text) {
  $('#loading-bar').css('width', percent + '%');
  if (text) $('#loading-text').text(text);
}

function loadSingleFile(item) {
  return new Promise((resolve, reject) => {
    if (item.type === 'audio') {
      const audio = new Audio();
      audio.src = item.src + '?v=' + Date.now();
      audio.oncanplaythrough = () => resolve();
      audio.onerror = () => item.required ? reject(item.src) : resolve();
    } else {
      const img = new Image();
      img.src = item.src + '?v=' + Date.now();
      img.onload = () => resolve();
      img.onerror = () => item.required ? reject(item.src) : resolve();
    }
  });
}

async function startQueuePreload() {
  if (totalCount === 0) return;

  async function worker() {
    while (fileIndex < totalCount && !hasError) {
      const currentIndex = fileIndex++;
      const item = preloadList[currentIndex];

      try {
        await loadSingleFile(item);
        loadedCount++;
        const pct = Math.floor((loadedCount / totalCount) * 90);
        updateUI(pct, `データを読み込み中です... (${pct}%)`);
      } catch (failedSrc) {
        hasError = true;
        $('#loading-error').text(`エラー: 必須ファイルの読み込みに失敗しました (${failedSrc})`).show();
        $('#loading-text').text('ロードが停止しました');
        break;
      }
    }
  }

  const workerCount = Math.min(MAX_CONCURRENT, totalCount);
  const workers = Array.from({ length: workerCount }, () => worker());
  await Promise.all(workers);
}

// --- [D. メイン実行フロー] ---
(async () => {
  await startQueuePreload();

  if (hasError) return;

  const elapsedTime = Date.now() - startTime;
  const remainingTime = Math.max(0, MIN_LOADING_TIME - elapsedTime);

  setTimeout(() => {
    updateUI(100, 'ロード完了！ (100%)');

    setTimeout(() => {
      if (isFinished) return;
      isFinished = true;

      $('#loading-overlay').remove();
      
      TYRANO.kag.ftag.startTag("return", {});
    }, 400);
  }, remainingTime);
})();
[endscript]

[s]