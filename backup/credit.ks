;=========================================
; クレジット画面
;=========================================

*credit_start

;-----------------------------------------
; 初期化・画面作成
;-----------------------------------------
[hidemenubutton]
[cm]
[tb_hide_message_window]
[freeimage layer="0"]
[freeimage layer="1"]
[freeimage layer="2"]

[bg storage="haikei/black.png" time="800"]
[playbgm storage="BGM2.mp3" loop="true"]

;-----------------------------------------
; HTMLの読み込み処理
;-----------------------------------------
[html layer="1"]
<div id="credit_wrapper" style="width:100%; height:100%; pointer-events:auto;"></div>
[endhtml]

[iscript]
// 外部HTMLファイルをロードして埋め込む
$.get("data/others/plugin/credit/credit.html", function(data) {
    $("#credit_wrapper").html(data);
});
[endscript]

;-----------------------------------------
; BACKボタンの配置
;-----------------------------------------
; ボタンのレイヤーを全面に押し出すため Fix ボタンを使用するか通常のボタンを配置
[button graphic="button17.png" x="1000" y="600" target=*credit_back]

[s]

;=========================================
; BACK
;=========================================

*credit_back

[stopbgm]

; ★ 1. 文字（メッセージレイヤー）を消去
[cm]
[tb_hide_message_window]

; ★ 2. 各前景レイヤーに配置した画像・オブジェクトをすべて消去
[freeimage layer="base"]
[freeimage layer="0"]
[freeimage layer="1"]
[freeimage layer="2"]

; ★ 3. 画面全体を一瞬黒で隠す（より自然に遷移させたい場合）
[bg storage="haikei/black.png" time="100"]

; ※タイトル画面へ戻る
[jump storage="title_screen.ks" target="*show_menu"]

[s]
