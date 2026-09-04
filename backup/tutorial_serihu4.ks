*start

[layopt layer="1" visible="true"]

[cm]
[image storage="&f.chara_img" layer="1" x="440" y="100" width="400" name="chara_stand"]

[tb_show_message_window]

[stopse]
[playse storage="&f.tut_v1"]
新クイズで遊ぼう！の世界へようこそたい！[p]

[stopse]
[playse storage="&f.tut_v2"]
クイズは各難易度ごとに20問ある中から、ランダムで最大10問が出題されるばい。[p]
[stopse]
[playse storage="&f.tut_v3"]
4つの選択肢から1つ選んで正解ば見つけてはいよ！[p]
[stopse]
[playse storage="&f.tut_v4"]
それじゃあ、ゲームの説明ばするけんね。[p]

[tb_hide_message_window]
[anim name="chara_stand" left="900" time="1000"]
[wa]
[tb_show_message_window]

; --- ライフの説明 ---
[image storage="tutorial/01.png" layer="2" x="100" y="100" width="600" name="tut_img"]

[stopse]
[playse storage="&f.tut_v5"]
左上に表示してあるとがライフたい。[p]

[stopse]
[playse storage="&f.tut_v6"]
選択ば間違えるとライフが1つ減るけんね。[p]

[stopse]
[playse storage="&f.tut_v7"]
ライフが全部なくなると、そこでクイズが終わってしまうけん注意してはいよ。[p]

[freeimage layer="2"]

; --- 制限時間の説明 ---
[stopse]
[playse storage="&f.tut_v8"]
次は制限時間について説明するばい！[p]

[image storage="tutorial/02.png" layer="2" x="100" y="100" width="600" name="tut_img"]

[stopse]
[playse storage="&f.tut_v9"]
画面の上に表示しとるとが制限時間たい。[p]

[stopse]
[playse storage="&f.tut_v10"]
ゲージが0になると不正解になって、ライフが1つ減るけんね。[p]

[stopse]
[playse storage="&f.tut_v11"]
あと、難易度が高うなればなるほど制限時間の早まるけん、気をつけてはいよ！[p]

[freeimage layer="2"]

; --- ヒントの説明 ---
[stopse]
[playse storage="&f.tut_v12"]
次はヒントの説明ばするけん！！[p]

[image storage="tutorial/04.png" layer="2" x="100" y="100" width="600" name="tut_img"]

[stopse]
[playse storage="&f.tut_v13"]
画面の右下に表示してあるとがヒントたい。[p]

[stopse]
[playse storage="&f.tut_v14"]
ヒントは難易度によって使える回数の決まっとるばってん、[p]

[stopse]
[playse storage="&f.tut_v15"]
4つの選択肢ば2つにしてくれるたいぎゃ素晴らしい機能たい！[p]

[stopse]
[playse storage="&f.tut_v16"]
問題で分からんくなったら遠慮せんで使ってみてはいよ。[r]
※説明書の中にLIFEの個数やヒントの使用回数を記載してありますのでそちらをお読みください。[p]

[freeimage layer="2"]

; --- チュートリアル終了 ---
[stopse]
[playse storage="&f.tut_v17"]
以上がチュートリアルとなるばい。[p]

[stopse]
[playse storage="&f.tut_v18"]
もう一回確認したい時は「アニメ_EASY」でチュートリアルの確認ができるけん、[p]

[stopse]
[playse storage="&f.tut_v19"]
忘れたと思ったら確認してみてはいよ！[p]

[stopse]
[playse storage="&f.tut_v20"]
それじゃあ、クイズば始めるばい！[p]

[stopse]
[tb_hide_message_window]

; レイヤー1（キャラ立ち絵など）を消去
[freeimage layer="1"]

; チュートリアル既読フラグを立てる
[eval exp="sf.tutorial_seen = true"]

; メインシナリオの問題ループへ戻る
[jump target="*question_loop"]