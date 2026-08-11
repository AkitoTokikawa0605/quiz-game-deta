; --- 1. 計測開始 ---
[iscript]
// 計測開始時刻（ミリ秒）を取得して一時変数に保持
tf.load_start_time = performance.now();
console.log("【計測開始】処理の読み込みをスタートします。");
[endscript]


; --- ここに計測したい処理や画像の読み込みを入れる ---
; 例：重い背景画像やUI素材の読み込み
; ① 画像を事前にロード（プリロード）する場合
[preload storage="data/bgimage/haikei/easy_haikei.png"]
[preload storage="data/bgimage/haikei/normal_haikei.png"]
[preload storage="data/fgimage/UI/level_haikei.png"]

; ② 実際に画面に背景画像を出す場合
[image layer="base" storage="&tf.current_bg" time="0"]

; ③ BGMを再生/読み込む場合
[playbgm storage="bgm1.ogg"]


; --- 2. 計測終了＆タイム出力 ---
[iscript]
// 計測終了時刻を取得
tf.load_end_time = performance.now();

// 経過時間（ミリ秒）を計算
tf.load_elapsed = Math.round(tf.load_end_time - tf.load_start_time);

// コンソールログへ表示（F12のデベロッパーツールで確認可能）
console.log("【計測完了】かかった時間: " + tf.load_elapsed + " ms (" + (tf.load_elapsed / 1000).toFixed(2) + " 秒)");
[endscript]

; --- 3. 画面上にメッセージとして表示したい場合（任意） ---
[tb_show_message_window]
読み込み時間：[emb exp="tf.load_elapsed"] ms（約[emb exp="(tf.load_elapsed / 1000).toFixed(2)"]秒）[p]
[tb_hide_message_window]