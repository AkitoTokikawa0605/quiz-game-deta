*start

[layopt layer="1" visible="true"]

[cm]
[image storage="&f.chara_img" layer="1" x="400" y="150" width="500" name="chara_stand"]

[tb_show_message_window]

[stopse]
[playse storage="&f.tut_v1"]
「新クイズで遊ぼう！」の世界へようこそなのだ！[p]

[stopse]
[playse storage="&f.tut_v2"]
クイズは難易度ごとに20問あって、その中からランダムで最大10問が出題されるのだ！[p]
[stopse]
[playse storage="&f.tut_v3"]
選択肢から1つを選んで、正解を見つけるのだ！[p]
[stopse]
[playse storage="&f.tut_v4"]
それじゃあ、ゲームの説明をするのだ！[p]

[tb_hide_message_window]
[anim name="chara_stand" left="900" time="1000"]
[wa]


; --- ライフの説明 ---
[image storage="tutorial/01.png" layer="2" x="270" y="45" width="750" name="tut_img"]

[tb_show_message_window]

[stopse]
[playse storage="&f.tut_v5"]
左上に表示されているのがライフなのだ[p]

[stopse]
[playse storage="&f.tut_v6"]
選択を間違えると、ライフが1つ減っちゃうのだ……！[p]

[stopse]
[playse storage="&f.tut_v7"]
ライフが全部なくなると、そこでクイズ終了になっちゃうから注意するのだ！[p]

[freeimage layer="2"]

; --- 制限時間の説明 ---
[stopse]
[playse storage="&f.tut_v8"]
次は制限時間について説明するのだ！[p]

[image storage="tutorial/02.png" layer="2" x="270" y="45" width="750" name="tut_img"]

[stopse]
[playse storage="&f.tut_v9"]
画面の上に表示されているのが制限時間なのだ。[p]

[stopse]
[playse storage="&f.tut_v10"]
ゲージが0になると不正解になって、ライフが1つ減っちゃうのだ。[p]

[stopse]
[playse storage="&f.tut_v11"]
難易度が高くなるほど制限時間が短くなるから、気をつけるのだ！[p]

[freeimage layer="2"]

; --- ヒントの説明 ---
[stopse]
[playse storage="&f.tut_v12"]
次はヒントの説明をするのだ！[p]

[image storage="tutorial/04.png" layer="2" x="270" y="45" width="750" name="tut_img"]

[stopse]
[playse storage="&f.tut_v13"]
画面の右下に表示されているのがヒントなのだ！[p]

[stopse]
[playse storage="&f.tut_v14"]
ヒントは難易度によって使える回数が決まっているけど、[p]

[stopse]
[playse storage="&f.tut_v15"]
4つの選択肢を2つに絞ってくれる素晴らしい機能なのだ！[p]

[stopse]
[playse storage="&f.tut_v16"]
分からない問題があったら、遠慮なく使うのだ！[r]
※説明書の中にLIFEの個数やヒントの使用回数を記載してありますのでそちらをお読みください。[p]

[freeimage layer="2"]

; --- チュートリアル終了 ---
[stopse]
[playse storage="&f.tut_v17"]
以上でチュートリアルは終わりなのだ！[p]

[stopse]
[playse storage="&f.tut_v18"]
もう一度確認したいときは、アニメのEASYでいつでも見直せるのだ。[p]

[stopse]
[playse storage="&f.tut_v19"]
忘れちゃったら確認してみるのだ！[p]

[stopse]
[playse storage="&f.tut_v20"]
それじゃあ、クイズを始めるのだー！[p]

[stopse]
[tb_hide_message_window]

; レイヤー1（キャラ立ち絵など）を消去
[freeimage layer="1"]

; チュートリアル既読フラグを立てる
[eval exp="sf.tutorial_seen = true"]

; ★ storage="..." にクイズ本編のファイル名を指定してジャンプ！
[jump storage="quiz_animation.ks" target="*question_loop"]
