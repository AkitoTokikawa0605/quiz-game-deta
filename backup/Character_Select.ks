[_tb_system_call storage=system/_Character_Select.ks]

;================================
; キャラクター選択画面
;================================

*select_chara

[iscript]
var style = document.createElement('style');
style.type = 'text/css';
style.innerHTML = `
/* ダイアログのテキスト部分で改行（\\n）を無効化させずそのまま改行させる */
.remodal-message, .remodal p, .remodal div {
    white-space: pre-wrap !important;
}
`;
document.getElementsByTagName('head')[0].appendChild(style);
[endscript]

[freeimage layer="2"]
[cm]

; 画面表示時のロック判定変数を初期化（誤作動防止）
[iscript]
tf.is_locked = false;
[endscript]

; 背景表示
[bg storage="haikei/select_haikei1.png" time="500"]

; BGM
[bgmopt volume="10"]
[playbgm storage="bgm4.ogg" loop="true"]

;================================
; 初期設定 ＆ 解放判定
;================================

[iscript]
if (f.current_idx == undefined) {
    f.current_idx = 1;
}

// 全ジャンルEASYクリア判定
if (sf.animation_easy && sf.game_easy && sf.netslang_easy && sf.zatsugaku_easy) {
    sf.unlock_zunda = true;
}

tf.max_chara = 5;
[endscript]

;================================
; 表示更新
;================================

*update_chara

[freeimage layer="2"]

; キャラクター表示
[if exp="f.current_idx == 1"]
    [image storage="onp/onp_normal.png" layer="2" x="350" y="160" width="580"]
[endif]

[if exp="f.current_idx == 2"]
    [image storage="quiz/quiz_normal.png" layer="2" x="460" y="180" width="400"]
[endif]

[if exp="f.current_idx == 3"]
    [image storage="tukuyomi/tukuyomi_normal.png" layer="2" x="420" y="160" width="450"]
[endif]

[if exp="f.current_idx == 4"]
    [image storage="ameno/ameno_normal.png" layer="2" x="310" y="150" width="550"]
[endif]

; ★ 5番：ずんだもん（チラつき防止＋シルエット表示）
[if exp="f.current_idx == 5"]
    [if exp="sf.unlock_zunda == true"]
        [image storage="zunda/zunda_normal.png" layer="2" x="440" y="150" width="400"]
    [else]
        ; ロック時は表示前のチラつきを防ぐため、一旦不透明度0で配置してから黒塗り表示する
        [image storage="zunda/zunda_normal.png" layer="2" x="380" y="150" width="500" name="lock_img"]
        [iscript]
        $(".lock_img").css("filter", "brightness(0)");
        [endscript]
    [endif]
[endif]


; タイトル文字
[image layer="2" page="fore" storage="UI/cala_haikei.png" x="400" y="-5" width="450" height="150" reflect="false" name="title_img"]


; キャラクター名
[if exp="f.current_idx == 1"]
    [image storage="UI/onp_1.png" size="32" x="480" y="125" width="320" height="70" color="white" align="center" layer="2"]
[endif]

[if exp="f.current_idx == 2"]
    [image storage="UI/quiz.png" size="32" x="480" y="125" width="320" height="70" color="white" align="center" layer="2"]
[endif]

[if exp="f.current_idx == 3"]
    [image storage="UI/tukuyomi.png" size="32" x="480" y="125" width="320" height="70" color="white" align="center" layer="2"]
[endif]

[if exp="f.current_idx == 4"]
    [image storage="UI/ameno.png" size="32" x="480" y="110" width="320" height="80" color="white" align="center" layer="2"]
[endif]

; 5番名札表示
[if exp="f.current_idx == 5"]
    [if exp="sf.unlock_zunda == true"]
        [image storage="UI/sample1.png" size="32" x="480" y="125" width="320" height="70" color="white" align="center" layer="2"]
    [else]
        [ptext layer="2" text="🔒 LOCKED" x="480" y="135" size="32" color="0xFF0000" width="320" align="center"]
    [endif]
[endif]


;================================
; ボタン配置
;================================

[glink target="*prev_chara" graphic="button/button10.png" x="300" y="350" width="50" height="100" layer="2"]

; 5番かつ未解放の時だけテストボイスボタンを隠す
[if exp="!(f.current_idx == 5 && sf.unlock_zunda != true)"]
    [glink target="*sample_voice" graphic="button/button2.png" x="530" y="500" width="100" height="20" layer="2"]
[endif]

[glink target="*next_chara" graphic="button/button9.png" x="830" y="350" width="50" height="100" layer="2"]
[glink target="*confirm_chara" graphic="button/button3.png" x="700" y="570" width="120" height="30" layer="2"]
[glink target="*cancel_chara" graphic="button/button4.png" x="320" y="570" width="120" height="30" layer="2"]
[s]
;================================
; 前のキャラ
;================================

*prev_chara

[iscript]
f.current_idx--;
if (f.current_idx < 1) {
    f.current_idx = tf.max_chara;
}
[endscript]

[jump target="*update_chara" storage=""]

;================================
; 次のキャラ
;================================

*next_chara

[iscript]
f.current_idx++;
if (f.current_idx > tf.max_chara) {
    f.current_idx = 1;
}
[endscript]

[jump target="*update_chara" storage=""]

;================================
; サンプルボイス
;================================

*sample_voice

[if exp="f.current_idx == 1"]
    [playse storage="voice/onp/sample_voice.ogg"]
[endif]

[if exp="f.current_idx == 2"]
    [playse storage="voice/quiz/sample_voice.ogg"]
[endif]

[if exp="f.current_idx == 3"]
    [playse storage="voice/tukuyomi/sample_voice.ogg"]
[endif]

[if exp="f.current_idx == 4"]
    [playse storage="voice/ameno/sample_voice.ogg"]
[endif]

[if exp="f.current_idx == 5 && sf.unlock_zunda == true"]
    [playse storage="voice/zunda/sample_voice.ogg"]
[endif]

[jump target="*update_chara" storage=""]

;================================
; 決定
;================================

*confirm_chara

[iscript]
tf.is_locked = (f.current_idx == 5 && !sf.unlock_zunda);
tf.dlg_msg = "このキャラクターはまだ解放されていません！<br>全ジャンルのEASYをクリアしてください。";
[endscript]

[if exp="tf.is_locked == true"]

    [dialog type="alert" text="&tf.dlg_msg"]
    [jump target="*update_chara" storage=""]

[endif]

; 3. 解放済みキャラの場合の処理（以下は通常通り進行）
[iscript]
if (f.current_idx == 1) { sf.selected_chara = "onp"; }
else if (f.current_idx == 2) { sf.selected_chara = "quiz"; }
else if (f.current_idx == 3) { sf.selected_chara = "tukuyomi"; }
else if (f.current_idx == 4) { sf.selected_chara = "ameno"; }
else if (f.current_idx == 5) { sf.selected_chara = "zunda"; }
[endscript]

; ボタン要素を消去
[cm]

; タイトルヘッダー画像を削除
[free name="title_img" layer="2"]

; 「決定しました！」画像を表示
[image layer="2" page="fore" storage="UI/kettei.png" x="410" y="-60" width="450" height="250" reflect="false"]

[playse storage="voice/confirm.ogg"]
[wait time="2000"]

; BGM音量を戻す
[bgmopt volume="&sf.bgm_vol"]

[freeimage layer="0"]
[freeimage layer="1"]
[freeimage layer="2"]

[cm]
[jump storage="title_screen.ks" target="*show_menu"]

;================================
; キャンセル
;================================

*cancel_chara

[cm]

[bgmopt volume="&sf.bgm_vol"]

[freeimage layer="0"]
[freeimage layer="1"]
[freeimage layer="2"]

[jump storage="title_screen.ks" target="*show_menu"]