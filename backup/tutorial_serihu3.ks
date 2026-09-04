*start

[layopt layer="1" visible="true"]

[cm]
[image storage="&f.chara_img" layer="1" x="440" y="100" width="400" name="chara_stand"]

[tb_show_message_window]

[stopse]
[playse storage="&f.tut_v1"]
「新クイズで遊ぼう！」の世界へようこそお願いいたします！[p]

[stopse]
[playse storage="&f.tut_v2"]
クイズは各難易度ごとに20問ご用意されておりまして、その中からランダムで最大10問が出題されますわ。[p]
[stopse]
[playse storage="&f.tut_v3"]
4つの選択肢の中から正解を1つ選んでみてくださいね。[p]
[stopse]
[playse storage="&f.tut_v4"]
それでは、ゲームのご説明をいたしますわ。[p]

[tb_hide_message_window]
[anim name="chara_stand" left="900" time="1000"]
[wa]
[tb_show_message_window]

; --- ライフの説明 ---
[image storage="tutorial/01.png" layer="2" x="100" y="100" width="600" name="tut_img"]

[stopse]
[playse storage="&f.tut_v5"]
画面左上に表示されていますのが「ライフ」でございます。[p]

[stopse]
[playse storage="&f.tut_v6"]
選択を間違えてしまうと、ライフが1つ減ってしまいますの。[p]

[stopse]
[playse storage="&f.tut_v7"]
ライフがすべてなくなると、そこでクイズが終了となってしまいますので、ご注意くださいね。[p]

[freeimage layer="2"]

; --- 制限時間の説明 ---
[stopse]
[playse storage="&f.tut_v8"]
続きまして、制限時間についてご説明いたします。[p]

[image storage="tutorial/02.png" layer="2" x="100" y="100" width="600" name="tut_img"]

[stopse]
[playse storage="&f.tut_v9"]
画面の上に表示されていますのが制限時間でございますわ。[p]

[stopse]
[playse storage="&f.tut_v10"]
ゲージが0になりますと不正解となり、ライフが1つ減ってしまいます。[p]

[stopse]
[playse storage="&f.tut_v11"]
また、難易度が高くなるほど制限時間の減りが早くなりますので、お気をつけくださいませ。[p]

[freeimage layer="2"]

; --- ヒントの説明 ---
[stopse]
[playse storage="&f.tut_v12"]
次はヒントについてのご説明ですわ！[p]

[image storage="tutorial/04.png" layer="2" x="100" y="100" width="600" name="tut_img"]

[stopse]
[playse storage="&f.tut_v13"]
画面の右下に表示されていますのがヒントでございます。[p]

[stopse]
[playse storage="&f.tut_v14"]
ヒントは難易度によって使用できる回数が決まっておりますけれど、[p]

[stopse]
[playse storage="&f.tut_v15"]
4つの選択肢を2つに絞ってくれる、とても素晴らしい機能なのですわ！[p]

[stopse]
[playse storage="&f.tut_v16"]
分からない問題がございましたら、遠慮なさらずに使ってみてくださいね。[r]
※説明書の中にLIFEの個数やヒントの使用回数を記載してありますのでそちらをお読みください。[p]

[freeimage layer="2"]

; --- チュートリアル終了 ---
[stopse]
[playse storage="&f.tut_v17"]
以上がチュートリアルとなりますわ。[p]

[stopse]
[playse storage="&f.tut_v18"]
もう一度確認したい場合はアニメのイージーでいつでもチュートリアルの確認ができますので、[p]

[stopse]
[playse storage="&f.tut_v19"]
忘れてしまいましたら見直してみてくださいね。[p]

[stopse]
[playse storage="&f.tut_v20"]
それでは、クイズを始めましょう！[p]

[stopse]
[tb_hide_message_window]

; レイヤー1（キャラ立ち絵など）を消去
[freeimage layer="1"]

; チュートリアル既読フラグを立てる
[eval exp="sf.tutorial_seen = true"]

; メインシナリオの問題ループへ戻る
[jump target="*question_loop"]

*start

[layopt layer="1" visible="true"]
[image storage="&f.chara_img" layer="1" x="440" y="100" width="400" name="chara_stand"]

[tb_show_message_window]
[playse storage="&f.wel_v1"]
ずんだもんだのだ！クイズへようこそ！[p]

[tb_hide_message_window]
[freeimage layer="1"]

[eval exp="sf.tutorial_seen = true"]

; ★ 元のクイズファイル（例: quiz_game.ks）の *question_loop へ戻る
[jump storage="quiz_game.ks" target="*question_loop"]