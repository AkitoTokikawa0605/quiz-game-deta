[_tb_system_call storage=system/_title_screen.ks]

; --- タイトル画面 ---

[cm]
[hidemenubutton]

[freeimage layer="1"]
[freeimage layer="2"]
[tb_clear_images]

; ========================================
; 1. オープニング動画再生
; ========================================

[movie storage="sdp.mp4" skip="false"]

[cm]
[wt]

; ========================================
; 2. 注意事項画面（一定時間表示して黒背景へ）
; ========================================

; 警告画像を表示（0.5秒かけてフェードイン）
[bg storage="haikei/keikoku.png" time="500"]

; 表示したまま3秒間キープ（3000 = 3秒）
[wait time="3000"]

; 黒背景へフェードアウト（0.5秒）
[bg storage="haikei/black.png" time="500"]

; 暗転の余韻（0.5秒）
[wait time="500"]


; ========================================
; 3. ローディング画面表示＆素材プリロード
; ========================================

[iscript]
// ローディング画面（HTML）を生成して画面最前面に表示
const charaGifPath = 'data/fgimage/gif/loading_chara.gif';

$('#loading-overlay').remove();

$('body').append(`
<div id="loading-overlay" style="
position: fixed;
left: 0;
top: 0;
width: 100%;
height: 100%;
z-index: 999999;
display: flex;
flex-direction: column;
justify-content: center;
align-items: center;
background: #000;
">
<!-- NOW LOADING... -->
<div style="
font-size: 32px;
font-weight: 800;
color: #ffde59;
letter-spacing: 2px;
text-shadow: 2px 2px 4px rgba(0,0,0,0.8), 0 0 10px rgba(255,222,89,0.3);
margin-bottom: 12px;
">NOW LOADING...</div>
<!-- 走るミニキャラGIF -->
<div style="
margin-bottom: 12px;
text-align: center;
">
<img id="loading-chara-gif" src="${charaGifPath}" style="width: 100px; height: auto; margin: 0 auto; display: block;" alt="Loading..." />
</div>
<!-- プログレスバー -->
<div style="
width: 340px;
height: 24px;
border: 3px solid #fff;
padding: 3px;
border-radius: 15px;
background: rgba(0,0,0,0.5);
box-shadow: 0 0 10px rgba(255,255,255,0.2), inset 0 2px 4px rgba(0,0,0,0.8);
margin-bottom: 10px;
">
<div id="loading-bar" style="
width: 0%;
height: 100%;
background-color: #00c896;
background: linear-gradient(180deg, #5effd8 0%, #00c896 100%);
border-radius: 10px;
box-shadow: 0 0 8px rgba(0,255,204,0.6), inset 0 1px 1px rgba(255,255,255,0.8);
transition: width 0.2s linear;
"></div>
</div>
<!-- 読み込み中テキスト -->
<div id="loading-text" style="
font-size: 13px;
color: #d0d7de;
letter-spacing: 1px;
text-shadow: 1px 1px 2px rgba(0,0,0,0.8);
font-weight: 500;
height: 18px;
line-height: 18px;
">データを読み込み中です... (0%)</div>
</div>
`);

// 読み込む素材一覧
const preloadList = [
    { src: './data/bgimage/haikei/title.png', type: 'image' },
    { src: './data/bgimage/haikei/title_01.png', type: 'image' },
    { src: './data/fgimage/UI/rogo.png', type: 'image' },
    { src: './data/fgimage/gif/cts2.gif', type: 'image' },
    { src: './data/bgm/bgm3.ogg', type: 'audio' },
    { src: './data/image/button/button30.png', type: 'image' },
    { src: './data/image/button/button30_1.png', type: 'image' },
    { src: './data/image/button/button31.png', type: 'image' },
    { src: './data/image/button/button31_1.png', type: 'image' },
    { src: './data/image/button/button32.png', type: 'image' },
    { src: './data/image/button/button32_1.png', type: 'image' },
    { src: './data/image/button/button33.png', type: 'image' },
    { src: './data/image/button/button33_1.png', type: 'image' }
];

const totalCount = preloadList.length;
let loadedCount = 0;

function updateUI(percent, text) {
    $('#loading-bar').css('width', percent + '%');
    if (text) $('#loading-text').text(text);
}

function loadSingleFile(item) {
    return new Promise((resolve) => {
        let isSettled = false;
        const timer = setTimeout(() => {
            if (!isSettled) { isSettled = true; resolve(); }
        }, 2000);

        const done = () => {
            if (!isSettled) { isSettled = true; clearTimeout(timer); resolve(); }
        };

        if (item.type === 'audio') {
            fetch(item.src + '?v=' + Date.now()).then(done).catch(done);
        } else {
            const img = new Image();
            img.src = item.src + '?v=' + Date.now();
            img.onload = done;
            img.onerror = done;
        }
    });
}

// 逐次ロード実行
(async () => {
    const startTime = Date.now();
    const MIN_LOADING_TIME = 3000; // 最低3秒間表示

    for (let i = 0; i < totalCount; i++) {
        await loadSingleFile(preloadList[i]);
        await new Promise(resolve => setTimeout(resolve, 120));

        loadedCount++;
        const pct = Math.floor((loadedCount / totalCount) * 100);
        updateUI(pct, 'データを読み込み中です... (' + pct + '%)');
    }

    const elapsedTime = Date.now() - startTime;
    const remainingTime = Math.max(300, MIN_LOADING_TIME - elapsedTime);

    setTimeout(() => {
        $('#loading-overlay').fadeOut(400, function() {
            $(this).remove();
            // 同一ファイル内の *game_end へジャンプ（storage指定なし）
            TYRANO.kag.ftag.startTag("jump", {
                target: "*game_end"
            });
        });
    }, remainingTime);
})();
[endscript]

; ロード処理完了待ち用の停止
[s]


; ========================================
; 4. タイトル背景表示（ロード完了後にここへ到達）
; ========================================

*game_end

[bg storage="haikei/title.png" time="800"]
[image layer="2" page="fore" storage="UI/rogo.png" x="340" y="35" width="680" height="350" reflect="false"]

[playbgm storage="bgm3.ogg" loop="true"]

; --- CLICK TO START 表示 ---

*title_loop

[image layer="2" page="fore" storage="gif/cts2.gif" x="350" y="450" width="600" height="150" name="blink_text"]

; 自ファイル内ジャンプなので storage は指定しない（target のみ）
[clickable x="0" y="0" width="1280" height="720" target="*first_menu"]
[s]

; --- メニュー表示 ---

*first_menu

[iscript]
sf.skip_menu_bgm = true;
[endscript]

[jump target="*show_menu" storage=""]
*show_menu

[bg storage="haikei/title_01.png" time="800"]
[if exp="sf.skip_menu_bgm != true"]
[playbgm storage="bgm3.ogg" loop="true"]
[endif]

[iscript]
sf.skip_menu_bgm = false;
[endscript]

[cm]
[freeimage layer="2"]
[freeimage layer="1"]

[image layer="2" page="fore" storage="UI/rogo.png" x="340" y="35" width="680" height="350" reflect="false"]

; --- ボタン表示 ---
; 自ファイル内ジャンプなので storage は指定しない（target のみ）

[button target="*game_start" graphic="button/button30.png" enterimg="button/button30_1.png" x="510" y="380" width="250"]
[button target="*game_chara_select" graphic="button/button31.png" enterimg="button/button31_1.png" x="510" y="460" width="250"]
[button target="*game_option" graphic="button/button32.png" enterimg="button/button32_1.png" x="510" y="545" width="250"]
[button target="*game_credit" graphic="button/button33.png" enterimg="button/button33_1.png" x="510" y="630" width="250"]
[s]

; --- ボタン押下処理 ---

*game_start
[tb_keyconfig flag="1"]
[jump storage="genre_select.ks" target="*genre_select"]
[s]

*game_chara_select
[jump storage="Character_Select.ks" target="*select_chara"]
[s]

*game_option
[cm]
[jump storage="option.ks" target="*start"]
[s]

*game_credit
[jump storage="credit.ks" target="*credit_start"]
[s]