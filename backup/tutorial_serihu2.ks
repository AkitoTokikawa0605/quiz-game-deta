*start

[layopt layer="1" visible="true"]

[cm]
[image storage="&f.chara_img" layer="1" x="440" y="100" width="400" name="chara_stand"]

[tb_show_message_window]

[stopse]
[playse storage="&f.tut_v1"]
べ、別にあなたを歓迎してるわけじゃないんだからね！[p]

[stopse]
[playse storage="&f.tut_v2"]
……ふん、『新クイズで遊ぼう！』の世界へようこそ、ってことにしておいてあげるわ。[p]

[stopse]
[playse storage="&f.tut_v3"]
ルールを説明するから、一回でちゃんと覚えなさいよね！[p]

[stopse]
[playse storage="&f.tut_v4"]
クイズは各難易度ごとに20問ある中から、ランダムで最大10問出題されるわ。[p]

[stopse]
[playse storage="&f.tut_v5"]
4つの選択肢から正解を1つ選べばいいだけ。[p]


[stopse]
[playse storage="&f.tut_v6"]
……まあ、あなたに解けるかは怪しいけど？[p]

[tb_hide_message_window]
[anim name="chara_stand" left="900" time="1000"]
[wa]
[tb_show_message_window]

; --- ライフの説明 ---
[image storage="tutorial/01.png" layer="2" x="100" y="100" width="600" name="tut_img"]

[stopse]
[playse storage="&f.tut_v7"]
ほら、画面左上を見なさいよ！。[p]

[stopse]
[playse storage="&f.tut_v8"]
それがあなたの「ライフ」よ。[p]

[stopse]
[playse storage="&f.tut_v9"]
間違えたらライフが1つ減るんだから。全部なくなったらその時点で即ゲームオーバーなんだからね！[p]

[stopse]
[playse storage="&f.tut_v10"]
冷やかしなら帰ってちょうだい！[p]

[freeimage layer="2"]

; --- 制限時間の説明 ---
[stopse]
[playse storage="&f.tut_v11"]
次は制限時間よ！[p]

[image storage="tutorial/02.png" layer="2" x="100" y="100" width="600" name="tut_img"]

[stopse]
[playse storage="&f.tut_v12"]
画面の上にゲージが見えるでしょ？あれがゼロになったら不正解扱い！[p]

[stopse]
[playse storage="&f.tut_v13"]
当然ライフも1つ減るわ。もたもたしてたらあっという間に終わっちゃうんだから、集中しなさいよね。[p]

[freeimage layer="2"]

; --- ヒントの説明 ---
[stopse]
[playse storage="&f.tut_v14"]
……まあ、あんたみたいなドジのために「ヒント」も用意してあげたわよ。[p]

[image storage="tutorial/04.png" layer="2" x="100" y="100" width="600" name="tut_img"]

[stopse]
[playse storage="&f.tut_v15"]
画面右下を見なさい。[p]

[stopse]
[playse storage="&f.tut_v16"]
難易度ごとに使える回数は決まってるけど、4つの選択肢を2つに減らしてくれるんだから！[p]

[stopse]
[playse storage="&f.tut_v17"]
……か、勘違いしないでよね！あんたを助けたいわけじゃなくて、あまりにも不甲斐ないところを見たくないだけなんだから！[p]

[stopse]
[playse storage="&f.tut_v18"]
分からないなら遠慮なく使いなさいよ。[r]
※説明書の中にLIFEの個数やヒントの使用回数を記載してありますのでそちらをお読みください。[p]

[freeimage layer="2"]

; --- チュートリアル終了 ---
[stopse]
[playse storage="&f.tut_v19"]
はい、チュートリアルは以上！[p]

[stopse]
[playse storage="&f.tut_v20"]
もし忘れたらアニメのイージーでまた確認できるわ。[p]

[stopse]
[playse storage="&f.tut_v21"]
べ、別に何度聞いたって教えてあげないこともないけど……次は一発で覚えなさいよね！[p]

[stopse]
[playse storage="&f.tut_v22"]
さあ、準備はいい？クイズを始めるわよ！足を引っ張らないでよね！[p]

[stopse]
[tb_hide_message_window]

; レイヤー1（キャラ立ち絵など）を消去
[freeimage layer="1"]

; チュートリアル既読フラグを立てる
[eval exp="sf.tutorial_seen = true"]

; メインシナリオの問題ループへ戻る
[jump target="*question_loop"]