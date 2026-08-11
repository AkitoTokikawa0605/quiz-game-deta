[_tb_system_call storage=system/_Character_Select.ks]


;================================
; キャラクター選択画面
;================================


*select_chara

[freeimage layer="2"]

[cm  ]

; 背景を表示


[bg  storage="haikei/select_haikei1.png"  time="500"  ]

; BGM
; キャラクター選択画面用BGM音量


[bgmopt volume="10"]

[playbgm  storage="bgm4.ogg"  loop="true"  ]

;================================
; 初期設定
;================================


[iscript]
if (f.current_idx == undefined) {
f.current_idx = 1;
}
[endscript]


;================================
; 表示更新
;================================


*update_chara

[freeimage layer="2"]


; キャラクター表示


[if exp="f.current_idx == 1"]

[image storage="zunda/zunda_normal.png" layer="2" x="440" y="150" width="400"]

[endif]

[if exp="f.current_idx == 2"]

[image storage="zunda/metan_normal.png" layer="2" x="440" y="150" width="400"]

[endif]

[if exp="f.current_idx == 3"]

[image storage="zunda/hau_normal.png" layer="2" x="440" y="150" width="400"]

[endif]

[if exp="f.current_idx == 4"]

[image storage="zunda/tumugi_normal.png" layer="2" x="440" y="150" width="400"]

[endif]


; タイトル文字


[image layer="2" page="fore" storage="UI/cala_haikei.png" x="400" y="-5" width="450" height="150" reflect="false"]


; キャラクター名


[if exp="f.current_idx == 1"]

[image storage="UI/sample1.png" size="32" x="480" y="125" width="320" height="70"  color="white" align="center" layer="2"]

[endif]

[if exp="f.current_idx == 2"]

[image storage="UI/sample2.png" size="32" x="480" y="125" width="320" height="70"  color="white" align="center" layer="2"]

[endif]

[if exp="f.current_idx == 3"]

[image storage="UI/sample3.png" size="32" x="480" y="125" width="320" height="70"  color="white" align="center" layer="2"]

[endif]

[if exp="f.current_idx == 4"]

[image storage="UI/sample4.png" size="32" x="480" y="125" width="320" height="70"  color="white" align="center" layer="2"]

[endif]


;================================
; ボタン
;================================


[glink  target="*prev_chara"  graphic="button/button10.png"  x="300"  y="350"  width="50"  height="100"  layer="2"  ]
[glink  target="*sample_voice"  graphic="button/button2.png"  x="530"  y="500"  width="100"  height="20"  layer="2"  ]
[glink  target="*next_chara"  graphic="button/button9.png"  x="830"  y="350"  width="50"  height="100"  layer="2"  ]
[glink  target="*confirm_chara"  graphic="button/button3.png"  x="700"  y="570"  width="120"  height="30"  layer="2"  ]
[glink  target="*cancel_chara"  graphic="button/button4.png"  x="320"  y="570"  width="120"  height="30"  layer="2"  ]
[s  ]

;================================
; 前のキャラ
;================================


*prev_chara

[iscript]
f.current_idx--;
if (f.current_idx < 1) {
f.current_idx = 4;
}
[endscript]

[jump  target="*update_chara"  storage=""  ]

;================================
; 次のキャラ
;================================


*next_chara

[iscript]
f.current_idx++;
if (f.current_idx > 4) {
f.current_idx = 1;
}
[endscript]

[jump  target="*update_chara"  storage=""  ]

;================================
; サンプルボイス
;================================


*sample_voice

[if exp="f.current_idx == 1"]

[playse  storage="voice/zunda_01.ogg"  ]
[endif]

[if exp="f.current_idx == 2"]

[playse  storage="voice/metan_sample.ogg"  ]
[endif]

[if exp="f.current_idx == 3"]

[playse  storage="voice/hau_sample.ogg"  ]
[endif]

[if exp="f.current_idx == 4"]

[playse  storage="voice/tumugi_sample.ogg"  ]
[endif]

[jump  target="*update_chara"  storage=""  ]

;================================
; 決定
;================================
*confirm_chara

[iscript]
// ▼▼ ここを「chara1」ではなく、フォルダ名（zunda等）に書き換える ▼▼
if (f.current_idx == 1) { sf.selected_chara = "zunda"; }
else if (f.current_idx == 2) { sf.selected_chara = "metan"; }
else if (f.current_idx == 3) { sf.selected_chara = "hau"; }
else if (f.current_idx == 4) { sf.selected_chara = "tumugi"; }

console.log("選択キャラ：" + sf.selected_chara);
[endscript]

[ptext text="このキャラクターに決定しました！" size="35" x="640" y="300" color="white" align="center" layer="2"]

[playse  storage="voice/confirm.ogg"  ]
[wait  time="2000"  ]

; BGM音量をオプション設定値へ戻す
[bgmopt volume="&sf.bgm_vol"]

[freeimage layer="0"]
[freeimage layer="1"]
[freeimage layer="2"]

[cm  ]
[jump  storage="title_screen.ks"  target="*show_menu"  ]
