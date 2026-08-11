[_tb_system_call storage=system/_genre_select.ks]


; --- ジャンル選択画面 ---


*genre_select

[cm  ]
[hidemenubutton]

[freeimage layer="2" page="fore"]

[tb_hide_message_window  ]
[bg  storage="haikei/genre_select_haikei.png"  time="500"  ]
[playbgm  storage="bgm1.ogg"  loop="true"  ]
[image layer="2" page="fore" storage="UI/jyanl_haikei.png" x="400" y="100" width="500" height="150" reflect="false"]


; --- 解放状態を判定 ---


[jump  cond="sf.genre_unlocked&nbsp;==&nbsp;true"  target="*genre_unlocked"  storage=""  ]
[jump  target="*genre_locked"  storage=""  ]

; =====================================
; 未解放状態
; =====================================


*genre_locked


; アニメだけ選択可能


[button  target="*difficulty_select"  graphic="button/button21.png"  enterimg="button/button21_1.png"  x="300"  y="380"  storage="quiz_animation.ks"  width="250"  ]

; ゲーム（ロック）


[image layer="2" page="fore" storage="button2/button020.png" x="700" y="380" width="250"]


; ネットスラング（ロック）


[image layer="2" page="fore" storage="button2/button019.png" x="300" y="550" width="250"]


; 雑学（ロック）


[image layer="2" page="fore" storage="button2/button018.png" x="700" y="550" width="250"]


; 戻る


[button  graphic="button/button17.png"  enterimg="button/button17_1.png"  x="1100"  y="650"  width="150"  height="50"  target="*back_to_title"  storage=""  ]
[s  ]

; =====================================
; 全ジャンル解放
; =====================================


*genre_unlocked


; アニメ


[button  target="*difficulty_select"  graphic="button/button21.png"  enterimg="button/button21_1.png"  x="300"  y="380"  storage="quiz_animation.ks"  width="250"  ]

; ゲーム


[button  target="*difficulty_select"  graphic="button/button20.png"  enterimg="button/button20_1.png"  x="700"  y="380"  storage="quiz_game.ks"  width="250"  ]

; ネットスラング


[button  target="*difficulty_select"  graphic="button/button19.png"  enterimg="button/button19_1.png"  x="300"  y="550"  storage="quiz_netslang.ks"  width="250"  ]

; 雑学


[button  target="*difficulty_select"  graphic="button/button18.png"  enterimg="button/button18_1.png"  x="700"  y="550"  storage="quiz_zatugaku.ks"  width="250"  ]

; 戻る


[button  graphic="button/button17.png"  enterimg="button/button17_1.png"  x="1100"  y="650"  width="150"  height="50"  target="*back_to_title"  storage=""  ]
[s  ]

; =====================================
; タイトルへ戻る
; =====================================


*back_to_title

[cm  ]
[clearfix]

[freeimage layer="1"]

[freeimage layer="2"]

[jump  storage="title_screen.ks"  target="*show_menu"  ]
