*start

[layopt layer="1" visible="true"]

[cm]
[image storage="&f.chara_img" layer="1" x="440" y="100" width="400" name="chara_stand"]

[tb_show_message_window]

[stopse]
[playse storage="&f.tut_v1"]
新クイズで遊ぼう！の世界へようこそ！[p]

[stopse]
[playse storage="&f.tut_v2"]
クイズは各難易度毎に20問がランダムで最大10問が出題されます。[p]
[stopse]
[playse storage="&f.tut_v3"]
4つの選択肢から1つを選んで正解を見つけてね！[p]
[stopse]
[playse storage="&f.tut_v4"]
では、ゲームの説明を行います。[p]

[tb_hide_message_window]
[anim name="chara_stand" left="900" time="1000"]
[wa]
[tb_show_message_window]

; --- ライフの説明 ---
[image storage="tutorial/01.png" layer="2" x="100" y="100" width="600" name="tut_img"]

[stopse]
[playse storage="&f.tut_v5"]
左上に表示されているのがライフとなります。[p]

[stopse]
[playse storage="&f.tut_v6"]
選択を間違えるとライフが1つ減ります。[p]

[stopse]
[playse storage="&f.tut_v7"]
ライフがすべてなくなると、そこでクイズが終了となるので注意してください。[p]

[freeimage layer="2"]

; --- 制限時間の説明 ---
[stopse]
[playse storage="&f.tut_v8"]
次は制限時間について説明するよ！[p]

[image storage="tutorial/02.png" layer="2" x="100" y="100" width="600" name="tut_img"]

[stopse]
[playse storage="&f.tut_v9"]
画面の上に表示しているのが制限時間です。[p]

[stopse]
[playse storage="&f.tut_v10"]
ゲージが0になると不正解となり、ライフが1つ減ります。[p]

[stopse]
[playse storage="&f.tut_v11"]
また、難易度が高くなるほど制限時間が早まるのでご注意ください。[p]

[freeimage layer="2"]

; --- ヒントの説明 ---
[stopse]
[playse storage="&f.tut_v12"]
次はヒントの説明をするよ！[p]

[image storage="tutorial/04.png" layer="2" x="100" y="100" width="600" name="tut_img"]

[stopse]
[playse storage="&f.tut_v13"]
画面右下に表示されているのがヒントです。[p]

[stopse]
[playse storage="&f.tut_v14"]
ヒントは難易度によって使用回数が決まっていますが[p]

[stopse]
[playse storage="&f.tut_v15"]
4つの選択肢を2つにしてくれる素晴らしい機能です。[p]

[stopse]
[playse storage="&f.tut_v16"]
問題で分からなかったら遠慮なく使用してみてください。[r]
※説明書の中にLIFEの個数やヒントの使用回数を記載してありますのでそちらをお読みください。[p]

[freeimage layer="2"]

; --- チュートリアル終了 ---
[stopse]
[playse storage="&f.tut_v17"]
以上がチュートリアルとなります。[p]

[stopse]
[playse storage="&f.tut_v18"]
再度確認したい場合は「EASY」でチュートリアルが確認ができるので[p]

[stopse]
[playse storage="&f.tut_v19"]
忘れたと思ったら確認してみてね！[p]

[stopse]
[playse storage="&f.tut_v20"]
では、クイズを始めるよ！[p]

[stopse]
[tb_hide_message_window]

; レイヤー1（キャラ立ち絵など）を消去
[freeimage layer="1"]

; チュートリアル既読フラグを立てる
[eval exp="sf.tutorial_seen = true"]

; メインシナリオの問題ループへ戻る
[jump target="*question_loop"]