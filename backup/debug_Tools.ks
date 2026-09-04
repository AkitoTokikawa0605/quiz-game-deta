[_tb_system_call storage=system/_debug_Tools.ks]


; ========================================
; クイズで遊ぼう！ デバッグモード（4ジャンル対応版）
; ========================================


*debug_select

[hidemenubutton]

[cm  ]
[freeimage layer="2"]

[bg  storage="haikei/sky.png"  time="300"  ]
[tb_show_message_window  ]

デバッグモード[p]
デバッグするクイズを選択するか、機能解放を行ってください[p]


[tb_hide_message_window  ]

; ----------------------------------------
; STEP 1: ジャンル選択（4種）＆ 全開放・戻るボタン
; ----------------------------------------


[glink  color="black"  target="*debug_anime"  text="アニメ"  size="26"  x="200"  y="200"  width="200"  height="70"  ]
[glink  color="black"  target="*debug_game"  text="ゲーム"  size="26"  x="450"  y="200"  width="200"  height="70"  ]
[glink  color="black"  target="*debug_netslang"  text="ネットスラング"  size="22"  x="700"  y="200"  width="200"  height="70"  ]
[glink  color="black"  target="*debug_zatugaku"  text="雑学"  size="26"  x="950"  y="200"  width="200"  height="70"  ]

; ★ ロック全解放用ボタン
[glink  color="red"  target="*debug_unlock_all"  text="全機能全解放（全難易度・ジャンル）"  size="22"  x="350"  y="330"  width="600"  height="60"  ]

; ★ 追加：タイトルへ戻るボタン
[glink  color="blue"  target="*back_to_title"  text="タイトルへ戻る"  size="22"  x="475"  y="430"  width="350"  height="60"  ]

[s  ]

; ----------------------------------------
; ★ 全機能一括解放処理
; ----------------------------------------
*debug_unlock_all

[iscript]
// 1. 全ジャンル解放フラグ
sf.unlock_genre = true;

// 2. 各ジャンル＆各難易度の解放フラグを一括 true
sf.animation_normal   = true;
sf.animation_hard     = true;
sf.animation_veryhard = true;

sf.game_normal        = true;
sf.game_hard          = true;
sf.game_veryhard      = true;

sf.netslang_normal    = true;
sf.netslang_hard      = true;
sf.netslang_veryhard  = true;

sf.trivia_normal      = true;
sf.trivia_hard        = true;
sf.trivia_veryhard    = true;

sf.zatugaku_normal    = true;
sf.zatugaku_hard      = true;
sf.zatugaku_veryhard  = true;
[endscript]

[tb_show_message_window]
すべてのジャンル・難易度のロックを全解放しました！[p]

[jump target="*debug_select" storage=""]


; ----------------------------------------
; ★ 追加：タイトル戻り処理
; ----------------------------------------
*back_to_title

[cm]
[freeimage layer="2"]
[jump storage="title_screen.ks" target="*first_menu"]


*debug_anime

[eval exp="tf.debug_target = 'anime'"]

[jump  target="*debug_question_select"  storage=""  ]
*debug_game

[eval exp="tf.debug_target = 'game'"]

[jump  target="*debug_question_select"  storage=""  ]
*debug_netslang

[eval exp="tf.debug_target = 'netslang'"]

[jump  target="*debug_question_select"  storage=""  ]
*debug_zatugaku

[eval exp="tf.debug_target = 'zatugaku'"]

[jump  target="*debug_question_select"  storage=""  ]

; ========================================
; STEP 2: 問題番号入力 / 全問テスト選択
; ========================================


*debug_question_select

[cm  ]
[tb_show_message_window  ]

デバッグモード[p]
問題番号を入力するか、「全問テスト」を選択してください[p]


[tb_hide_message_window  ]
[edit  name="tf.debug_question_input"  width="200"  height="50"  size="30"  left="400"  top="260"  maxchars="3"  initial="1"  ]
[button  target="*debug_question_confirm"  graphic="button/button3.png"  enterimg="button/button03.png"  x="620"  y="260"  width="150"  height="50"  storage=""  ]
[glink  color="blue"  target="*debug_all_confirm"  text="全問を順番にテスト"  size="20"  x="400"  y="340"  width="370"  height="50"  ]

; ★ 追加：STEP 2 からもタイトル・ジャンル選択に戻れるボタン
[glink  color="black"  target="*debug_select"  text="ジャンル選択に戻る"  size="18"  x="310"  y="430"  width="260"  height="50"  ]
[glink  color="blue"  target="*back_to_title"  text="タイトルへ戻る"  size="18"  x="610"  y="430"  width="260"  height="50"  ]

[s  ]
*debug_question_confirm

[commit  ]
[eval exp="tf.debug_all = false"]

[eval exp="tf.debug_question = parseInt(tf.debug_question_input, 10)"]

[jump  target="*debug_difficulty_select"  storage=""  ]
*debug_all_confirm

[eval exp="tf.debug_all = true"]

[jump  target="*debug_difficulty_select"  storage=""  ]

; ========================================
; STEP 3: 難易度・背景選択（★ラベルを追加）
; ========================================


*debug_difficulty_select

[cm  ]
[tb_show_message_window  ]
[if exp="tf.debug_all == true"]


モード：全問連続テスト[p]


[r]

[else]


選択問題：第 [p]


[emb exp="tf.debug_question"]


問[p]


[r]

[endif]


難易度による背景を選択してください。[p]


[tb_hide_message_window  ]
[glink  color="black"  target="*debug_bg_easy"  text="EASY"  size="24"  x="300"  y="400"  width="150"  height="50"  ]
[glink  color="black"  target="*debug_bg_normal"  text="NORMAL"  size="24"  x="500"  y="400"  width="150"  height="50"  ]
[glink  color="black"  target="*debug_bg_hard"  text="HARD"  size="24"  x="700"  y="400"  width="150"  height="50"  ]
[glink  color="black"  target="*debug_bg_veryhard"  text="VERY&nbsp;HARD"  size="24"  x="900"  y="400"  width="150"  height="50"  ]
[s  ]

; ========================================
; 難易度・背景の設定
; ========================================


*debug_bg_easy

[eval exp="tf.debug_bg = 'haikei/easy_haikei.png'"]

[eval exp="tf.diff = 'easy'"]

[jump  target="*debug_start"  storage=""  ]
*debug_bg_normal

[eval exp="tf.debug_bg = 'haikei/normal_haikei.png'"]

[eval exp="tf.diff = 'normal'"]

[jump  target="*debug_start"  storage=""  ]
*debug_bg_hard

[eval exp="tf.debug_bg = 'haikei/hard_haikei.png'"]

[eval exp="tf.diff = 'hard'"]

[jump  target="*debug_start"  storage=""  ]
*debug_bg_veryhard

[eval exp="tf.debug_bg = 'haikei/very_hard_haikei.png'"]

[eval exp="tf.diff = 'veryhard'"]

[jump  target="*debug_start"  storage=""  ]

; ========================================
; STEP 4: 各ファイルへ分岐＆ジャンプ
; ========================================


*debug_start

[commit  ]
[cm  ]
[eval exp="tf.debug_mode = true"]

[if exp="tf.debug_target == 'anime'"]

[jump  storage="quiz_animation.ks"  target="*setup_game"  ]
[elsif exp="tf.debug_target == 'game'"]

[jump  storage="quiz_game.ks"  target="*setup_game"  ]
[elsif exp="tf.debug_target == 'netslang'"]

[jump  storage="quiz_netslang.ks"  target="*setup_game"  ]
[elsif exp="tf.debug_target == 'zatugaku'"]

[jump  storage="quiz_zatugaku.ks"  target="*setup_game"  ]
[endif]