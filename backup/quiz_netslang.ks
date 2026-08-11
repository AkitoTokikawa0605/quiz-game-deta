[_tb_system_call storage=system/_quiz_netslang.ks]


; --- 1. 難易度選択 ---


*difficulty_select

[hidemenubutton]

[cm  ]
[tb_hide_message_window  ]
[freeimage layer="0"]

[freeimage layer="1"]

[freeimage layer="2"]

[bg  storage="haikei/sky.png"  time="800"  ]
[image layer="2" page="fore" storage="UI/level_haikei.png" x="350" y="35" width="550" height="150" reflect="false"]

[button  target="*start_game"  graphic="button/button34.png"  enterimg="button/button34_1.png"  x="50"  y="250"  width="250"  height="450"  exp="tf.diff='easy'"  storage=""  ]
[button  target="*start_game"  graphic="button/button35.png"  enterimg="button/button35_1.png"  x="350"  y="250"  width="250"  height="450"  exp="tf.diff='normal'"  storage=""  ]
[button  target="*start_game"  graphic="button/button36.png"  enterimg="button/button36_1.png"  x="650"  y="250"  width="250"  height="450"  exp="tf.diff='hard'"  storage=""  ]
[button  target="*start_game"  graphic="button/button37.png"  enterimg="button/button37_1.png"  x="950"  y="250"  width="250"  height="450"  exp="tf.diff='veryhard'"  storage=""  ]
[s  ]

; --- 2. ゲーム開始設定 ---


*start_game

[cm  ]
[freeimage layer="base"]

[freeimage layer="0"]

[freeimage layer="1"]

[freeimage layer="2"]

[iscript]
// ★ここで出題数を10問に設定
tf.question_count = 10;
// クイズデータ
tf.all_questions = [
{q: "第1問", difficulty: "easy", choices: ["「笑える」という意味で使われる「草」の由来は？", "A.草食系だから", "B.wが草に見えるから", "C.草むらに隠れるから", "D.草を食べるから"], ans: "B"},
{q: "第2問", difficulty: "easy", choices: ["「炎上」とはどういう状態のこと？", "A.火事を消すこと", "B.ネットで批判が殺到すること", "C.料理を焦がすこと", "D.キャンプをすること"], ans: "B"},
{q: "第3問", difficulty: "normal", choices: ["「kwsk」の意味は？", "A.詳しく", "B.帰ってくれ", "C.かわいそう", "D.怖い"], ans: "A"},
{q: "第4問", difficulty: "normal", choices: ["「飯テロ」とはどのような行為？", "A.食事をテロリストに提供する", "B.深夜に美味しそうな料理画像を投稿する", "C.食事中に爆弾を仕掛ける", "D.料理をわざと捨てる"], ans: "B"},
{q: "第5問", difficulty: "hard", choices: ["「禿同」の意味は？", "A.ハゲている人が同意すること", "B.激しく同意", "C.ハゲている人に同情する", "D.絶対に認めない"], ans: "B"},
{q: "第6問", difficulty: "veryhard", choices: ["「微レ存」の読み方は？", "A.びれぞん", "B.びびるそん", "C.びれぞんて", "D.わずかながら存在する"], ans: "D"},
{q: "第7問", difficulty: "easy", choices: ["「推し」とはどういう意味？", "A.押してほしい場所", "B.一番応援している人やキャラクター", "C.力ずくで動かすこと", "D.重い荷物"], ans: "B"},
{q: "第8問", difficulty: "normal", choices: ["「メンヘラ」の語源になったのは？", "A.メンタルヘルス", "B.麺を食べる人", "C.メンマが好きな人", "D.メンタルがヘラヘラしている人"], ans: "A"},
{q: "第9問", difficulty: "hard", choices: ["「凸（とつ）」の本来の意味は？", "A.突撃すること", "B.凸凹の凸", "C.特別に突っ込む", "D.時計を見ること"], ans: "A"},
{q: "第10問", difficulty: "veryhard", choices: ["「了解道中膝栗毛」の意味は？", "A.膝が痛い", "B.了解（ネタ的に長くした表現）", "C.旅行に行く", "D.馬に乗る"], ans: "B"},
{q: "第11問", difficulty: "easy", choices: ["「オワコン」とは？", "A.終わったコンテンツ", "B.追いかけたいコンテンツ", "C.美味しいこんぶ", "D.面白いコンサート"], ans: "A"},
{q: "第12問", difficulty: "normal", choices: ["「wktk」の読み方は？", "A.わくわく", "B.わかたか", "C.わくとき", "D.わかとき"], ans: "A"},
{q: "第13問", difficulty: "hard", choices: ["「ROMる」とは？", "A.ロムを回す", "B.閲覧のみで参加しないこと", "C.ローマに行く", "D.ロボットになる"], ans: "B"},
{q: "第14問", difficulty: "easy", choices: ["「神回」とは？", "A.神様が出る回", "B.非常に素晴らしい出来の回", "C.神様の話", "D.神妙な顔つき"], ans: "B"},
{q: "第15問", difficulty: "normal", choices: ["「厨二病（中二病）」の由来は？", "A.中学2年生頃の背伸びした言動", "B.中学2年生の病気", "C.給食を食べる病気", "D.中学2年生のランキング"], ans: "A"},
{q: "第16問", difficulty: "hard", choices: ["「養分」とは、主にどういう人を指す？", "A.栄養をあげる人", "B.パチンコ等で負け続けている人", "C.植物を育てる人", "D.給食費を払う人"], ans: "B"},
{q: "第17問", difficulty: "veryhard", choices: ["「全裸待機」の由来は？", "A.全裸で待つというジョーク", "B.本当に全裸で待つ文化", "C.服を脱ぐと電波がいいから", "D.夏場だから"], ans: "A"},
{q: "第18問", difficulty: "easy", choices: ["「ガチ」とはどういう意味？", "A.おふざけ", "B.本気", "C.冗談", "D.準備運動"], ans: "B"},
{q: "第19問", difficulty: "normal", choices: ["「尊い」とはSNSでどういう時に使う？", "A.お寺に行った時", "B.推しが素晴らしすぎて言葉を失う時", "C.お金を拾った時", "D.偉い人を見た時"], ans: "B"},
{q: "第20問", difficulty: "hard", choices: ["「ktkr」の読み方は？", "A.帰ってこれ", "B.来たこれ", "C.かったこれ", "D.くたばれ"], ans: "B"},
{q: "第21問", difficulty: "easy", choices: ["「乙」の読み方は？", "A.おつかれさま", "B.おと", "C.おつ", "D.おつよい"], ans: "A"},
{q: "第22問", difficulty: "normal", choices: ["「ニキ」の由来は？", "A.二木さん", "B.兄貴（アニキ）", "C.人気者", "D.煮込み"], ans: "B"},
{q: "第23問", difficulty: "hard", choices: ["「メシウマ」の本来の意味は？", "A.美味しいご飯", "B.他人の不幸でご飯がうまい", "C.馬のご飯", "D.美味しいもの"], ans: "B"},
{q: "第24問", difficulty: "veryhard", choices: ["「養豚場」と呼ばれた掲示板のファン層は？", "A.特定のアイドルのファン", "B.豚の飼育者", "C.豚肉愛好家", "D.動物愛護団体"], ans: "A"},
{q: "第25問", difficulty: "easy", choices: ["「既読スルー」とは？", "A.既読なのに返信しないこと", "B.既読して返信すること", "C.すぐに返信すること", "D.読まずに消すこと"], ans: "A"},
{q: "第26問", difficulty: "normal", choices: ["「鯖（さば）」がネットで指すものは？", "A.魚", "B.サーバー", "C.サービス", "D.サブアカウント"], ans: "B"},
{q: "第27問", difficulty: "hard", choices: ["「ちな」とはどういう意味？", "A.ちなみに", "B.血なまぐさい", "C.知らなーい", "D.小さいな"], ans: "A"},
{q: "第28問", difficulty: "easy", choices: ["「マジレス」とは？", "A.マジでレスリングすること", "B.真面目な返信", "C.マジなレストラン", "D.嘘の返信"], ans: "B"},
{q: "第29問", difficulty: "normal", choices: ["「エモい」の由来は？", "A.絵文字", "B.エモーショナル", "C.ええもん", "D.エモー"], ans: "B"},
{q: "第30問", difficulty: "hard", choices: ["「詰んだ」とはどういう状態？", "A.荷物を積むこと", "B.どうにもならない状態", "C.チェスで勝つこと", "D.車に積むこと"], ans: "B"},
{q: "第31問", difficulty: "veryhard", choices: ["「虹裏」と呼ばれる掲示板は？", "A.ふたば☆ちゃんねる", "B.2ちゃんねる", "C.5ちゃんねる", "D.Twitter"], ans: "A"},
{q: "第32問", difficulty: "easy", choices: ["「激おこ」の続きは？", "A.ぷんぷん丸", "B.むかむか", "C.いらいら", "D.わくわく"], ans: "A"},
{q: "第33問", difficulty: "normal", choices: ["「かまちょ」とは？", "A.かまぼこ大好き", "B.かまってほしい人", "C.鎌倉に行く人", "D.構わないでほしい人"], ans: "B"},
{q: "第34問", difficulty: "hard", choices: ["「釣り」とは？", "A.魚を釣ること", "B.嘘の書き込みで反応を楽しむこと", "C.川に行くこと", "D.人を叩くこと"], ans: "B"},
{q: "第35問", difficulty: "easy", choices: ["「垢（あか）」とは？", "A.垢すり", "B.アカウント", "C.赤色", "D.明るい"], ans: "B"},
{q: "第36問", difficulty: "normal", choices: ["「沼る」とは？", "A.湿地に行く", "B.何かに深くハマること", "C.泥遊びをする", "D.沼で釣りをする"], ans: "B"},
{q: "第37問", difficulty: "veryhard", choices: ["「DKT」の意味は？", "A.大公開", "B.だいこうきん（大光金）", "C.大金", "D.大凶"], ans: "B"},
{q: "第38問", difficulty: "hard", choices: ["「逝く」とネットで書く場合、どういう意味？", "A.死ぬ、あるいは消滅する", "B.旅行に行く", "C.学校に行く", "D.病院に行く"], ans: "A"},
{q: "第39問", difficulty: "easy", choices: ["「優勝」とはスラングで？", "A.試合に勝つこと", "B.最高、素晴らしいという感情", "C.運動会", "D.金メダル"], ans: "B"},
{q: "第40問", difficulty: "normal", choices: ["「オワタ」の元ネタは？", "A.ゲームの『ロードモナーク』", "B.歌の歌詞", "C.漫画のセリフ", "D.アニメのセリフ"], ans: "A"},
{q: "第41問", difficulty: "hard", choices: ["「ググる」とは？", "A.グーグルで検索する", "B.グーを出す", "C.ぐーたらする", "D.ぐっと我慢する"], ans: "A"},
{q: "第42問", difficulty: "easy", choices: ["「メンタル」とは？", "A.金属", "B.精神面", "C.面接", "D.麺類"], ans: "B"},
{q: "第43問", difficulty: "normal", choices: ["「鯖落ち」とは？", "A.魚が落ちる", "B.サーバーがダウンすること", "C.サービスが落ちる", "D.サブキャラが落ちる"], ans: "B"},
{q: "第44問", difficulty: "hard", choices: ["「ポチる」とは？", "A.犬を飼う", "B.ネット通販で購入ボタンを押す", "C.ポチ袋をもらう", "D.点をつける"], ans: "B"},
{q: "第45問", difficulty: "veryhard", choices: ["「リーマン」はサラリーマンのことだが、「リーマンショック」的な意味以外でスラングとして使われるのは？", "A.サラリーマン", "B.リーマン（数学者）", "C.レイマン", "D.ただの誤字"], ans: "A"},
{q: "第46問", difficulty: "easy", choices: ["「了解」とネットで略すと？", "A.りょ", "B.り", "C.りょう", "D.了解です"], ans: "A"},
{q: "第47問", difficulty: "normal", choices: ["「民（たみ）」が接尾語につくのは？", "A.その作品のファン", "B.国民", "C.住民", "D.県民"], ans: "A"},
{q: "第48問", difficulty: "hard", choices: ["「地雷」とは？", "A.爆弾", "B.付き合うと面倒な人", "C.地面の雷", "D.爆発すること"], ans: "B"},
{q: "第49問", difficulty: "easy", choices: ["「マウントを取る」とは？", "A.山に登る", "B.優位に立とうとする", "C.写真を撮る", "D.マウントを取る（格闘技）"], ans: "B"},
{q: "第50問", difficulty: "normal", choices: ["「爆死」とは？", "A.爆弾で死ぬこと", "B.ガチャで大金を使い何も出ないこと", "C.アクション映画", "D.ゲームオーバー"], ans: "B"}
];
if(tf.diff == null) tf.diff = "easy";
tf.filtered = tf.all_questions.filter(function(q) {
var level = q.difficulty || "easy";
if(tf.diff == "easy") return level == "easy";
if(tf.diff == "normal") return (level == "easy" || level == "normal");
if(tf.diff == "hard") return (level == "easy" || level == "normal" || level == "hard");
return true;
});
for (var i = tf.filtered.length - 1; i > 0; i--) {
var j = Math.floor(Math.random() * (i + 1));
var temp = tf.filtered[i];
tf.filtered[i] = tf.filtered[j];
tf.filtered[j] = temp;
}
tf.selected_questions = tf.filtered.slice(0, tf.question_count);
tf.current_index = 0;
tf.score = 0;
// ★背景指定もライフもすべてここでまとめて処理
if(tf.diff == "easy"){
tf.max_life = 5;
tf.time_limit = 60;
tf.hint_count = 5; // イージーは5回
tf.current_bg = 'haikei/easy_haikei.png';
} else if(tf.diff == "normal"){
tf.max_life = 3;
tf.time_limit = 60;
tf.hint_count = 3; // ノーマルは3回
tf.current_bg = 'haikei/normal_haikei.png';
} else if(tf.diff == "hard"){
tf.max_life = 2;
tf.time_limit = 60;
tf.hint_count = 1; // ハードは1回
tf.current_bg = 'haikei/hard_haikei.png';
} else if(tf.diff == "veryhard"){
tf.max_life = 1;
tf.time_limit = 60;
tf.hint_count = 0; // ベリーハードは0回（使えない！）
tf.current_bg = 'haikei/very_hard_haikei.png';
}
tf.life = tf.max_life;
[endscript]

[image layer="base" storage="&tf.current_bg" time="1000"]

[playbgm  storage="bgm1.ogg"  ]
[jump  target="*welcome_scene"  storage=""  ]

; --- ライフ表示 ---


*show_life


; 古いハートの画像をレイヤー2から消去


[free layer="2" name="life_heart"]

[iscript]
tf.h1 = (tf.life >= 1) ? "UI/heart1.png" : "UI/heart01.png";
tf.h2 = (tf.life >= 2) ? "UI/heart1.png" : "UI/heart01.png";
tf.h3 = (tf.life >= 3) ? "UI/heart1.png" : "UI/heart01.png";
tf.h4 = (tf.life >= 4) ? "UI/heart1.png" : "UI/heart01.png";
tf.h5 = (tf.life >= 5) ? "UI/heart1.png" : "UI/heart01.png";
[endscript]

[image layer="2" name="life_heart" storage="&tf.h1" x="40"  y="40" width="50" height="50" cond="tf.max_life >= 1"]

[image layer="2" name="life_heart" storage="&tf.h2" x="100" y="40" width="50" height="50" cond="tf.max_life >= 2"]

[image layer="2" name="life_heart" storage="&tf.h3" x="160" y="40" width="50" height="50" cond="tf.max_life >= 3"]

[image layer="2" name="life_heart" storage="&tf.h4" x="220" y="40" width="50" height="50" cond="tf.max_life >= 4"]

[image layer="2" name="life_heart" storage="&tf.h5" x="280" y="40" width="50" height="50" cond="tf.max_life >= 5"]

[return  ]

; --- ウェルカム演出 ---


*welcome_scene

[iscript]
if(tf.diff == "easy") { tf.diff_name = "イージー"; }
else if(tf.diff == "normal") { tf.diff_name = "ノーマル"; }
else if(tf.diff == "hard") { tf.diff_name = "ハード"; }
else if(tf.diff == "veryhard") { tf.diff_name = "ベリーハード"; }
f.chara_img = "zunda/" + sf.selected_chara + "_normal.png";
f.voice1 = "voice/" + sf.selected_chara + "/welcome1_" + tf.diff + ".ogg";
f.voice2 = "voice/" + sf.selected_chara + "/welcome2.ogg";
f.voice3 = "voice/" + sf.selected_chara + "/welcome3.ogg";
[endscript]

[layopt layer="1" visible="true"]

[image storage="&f.chara_img" layer="1" x="440" y="100" width="400" name="chara_stand"]

[tb_show_message_window  ]
[playse  storage="&f.voice1"  ]

ようこそ！クイズで遊ぼう！の[p]


[emb exp="tf.diff_name"]


の世界へ！[p]


[playse  storage="&f.voice2"  ]

クイズはランダムで10問を出題するので選択肢の中から選んでね！[p]


[playse  storage="&f.voice3"  ]

では、クイズを始めるよ！[p]


[tb_hide_message_window  ]
[anim  name="chara_stand"  left="900"  time="1000"  ]
[wa  ]
[freeimage layer="1"]


; --- 4. クイズループ ---


*question_loop

[iscript]
if(tf.current_index >= tf.question_count){
tf.loop_next = "*quiz_end";
} else {
tf.loop_next = "*continue_quiz";
}
[endscript]

[jump  target="&tf.loop_next"  storage=""  ]
*continue_quiz

[iscript]
tf.time_limit = 60;
tf.time_left = tf.time_limit;
var q = tf.selected_questions[tf.current_index];
tf.q_title = "第" + (tf.current_index + 1) + "問：";
tf.q_text = q.choices[0];
var ans_idx = "ABCD".indexOf(q.ans) + 1;
tf.correct_text = q.choices[ans_idx];
var choices = [q.choices[1], q.choices[2], q.choices[3], q.choices[4]];
for (var k = choices.length - 1; k > 0; k--) {
var m = Math.floor(Math.random() * (k + 1));
var tmp = choices[k];
choices[k] = choices[m];
choices[m] = tmp;
}
tf.shuffled = choices;
tf.show0 = true;
tf.show1 = true;
tf.show2 = true;
tf.show3 = true;
tf.anim_time = (tf.time_limit + 18) * 1000;
; ▼▼ ここに「次の問題に進んだらその問題のヒント使用フラグをリセットする」を入れる！ ▼▼
tf.hint_used = false;
[endscript]


; ▼▼ ライフ・ずんだもん・問題文の描画をここでしっかり行う ▼▼


[call  target="*show_life"  storage=""  ]
[cm  ]
[layopt  layer="1"  visible="true"  ]

[image storage="&f.chara_img" layer="1" x="900" y="100" width="400" name="chara_stand"]

[tb_show_message_window  ]

; --- タイマーの枠とゲージ・カバーの準備 ---


[image layer="2" storage="UI/bar_hk.png" x="410" y="70" name="time_bar_hk" width="470" height="70"]

[image layer="2" storage="UI/gage.png" x="410" y="70" name="time_gage" width="470" height="70"]

[image layer="2" storage="UI/time_cover.png" x="320" y="15" name="time_cover" width="600" height="150"]

[cm  ]
[tb_show_message_window  ]
[emb exp="tf.q_title"]

[p]

[layopt layer="2" visible="true"]

[ptext layer="2" name="question_text" text="&tf.q_text" x="350" y="180" size="22" color="0x000000" width="600" align="center"]

[tb_hide_message_window  ]

; --- タイマー＆バー連動開始 ---


[iscript]
tf.timer_id = setInterval(function(){
tf.time_left--;
if(tf.time_left <= 0){
clearInterval(tf.timer_id);
TYRANO.kag.ftag.startTag("jump", {target:"*time_up"});
}
}, 1000);
[endscript]

[anim  name="time_gage"  width="0"  time="&tf.anim_time"  ]
*show_choices

[cm  ]
[tb_hide_message_window  ]
[glink  color="black"  target="*check_answer"  text="&tf.shuffled[0]"  size="20"  x="250"  y="430"  width="350"  exp="tf.choice_num=0"  cond="tf.show0"  ]
[glink  color="black"  target="*check_answer"  text="&tf.shuffled[1]"  size="20"  x="680"  y="430"  width="350"  exp="tf.choice_num=1"  cond="tf.show1"  ]
[glink  color="black"  target="*check_answer"  text="&tf.shuffled[2]"  size="20"  x="250"  y="520"  width="350"  exp="tf.choice_num=2"  cond="tf.show2"  ]
[glink  color="black"  target="*check_answer"  text="&tf.shuffled[3]"  size="20"  x="680"  y="520"  width="350"  exp="tf.choice_num=3"  cond="tf.show3"  ]
[free  layer="2"  name="hint_btn"  ]

[button  storage=""  target="*use_hint"  graphic="button/button1.png"  enterimg="button/button01.png"  x="1000"  y="600"  name="hint_btn"  ]
[iscript]
// ① まず最初に、ボタンを必ず「通常のカラー＆押せる状態」にきれいにリセットする！
$(".hint_btn").css({
"filter": "none",
"opacity": "1.0",
"pointer-events": "auto"
});
// ② その上で、ヒント使用済み、または残り回数が0のときだけグレーアウト＆クリック無効にする
if(tf.hint_used == true || tf.hint_count <= 0){
$(".hint_btn").css({
"filter": "grayscale(100%)",
"opacity": "0.5",
"pointer-events": "none"
});
}
[endscript]

[s  ]

; --- ヒント処理 ---


*use_hint

[iscript]
(function(){
if(tf.hint_count <= 0 || tf.hint_used) {
return;
}
var wrong_indexes = [];
for(var i = 0; i < tf.shuffled.length; i++){
if(tf.shuffled[i] !== tf.correct_text){
wrong_indexes.push(i);
}
}
wrong_indexes.sort(function(){ return Math.random() - 0.5; });
if(wrong_indexes.length >= 2){
tf.shuffled[wrong_indexes[0]] = "";
tf.shuffled[wrong_indexes[1]] = "";
}
tf.hint_used = true;
tf.hint_count--;
// ▼▼ ここに「空文字になった選択肢のスイッチをオフにする処理」を復活させる！ ▼▼
tf.show0 = (tf.shuffled[0] !== "");
tf.show1 = (tf.shuffled[1] !== "");
tf.show2 = (tf.shuffled[2] !== "");
tf.show3 = (tf.shuffled[3] !== "");
})();
[endscript]


; ボタンをグレーアウト＆クリック無効に切り替える


[iscript]
$(".hint_btn img").css({
"filter": "grayscale(100%)",
"opacity": "0.5"
});
$(".hint_btn").css("pointer-events", "none");
[endscript]

[jump  target="*show_choices"  storage=""  ]

; --- 5. 判定・終了 ---


*check_answer

[cm  ]
[tb_show_message_window  ]
[iscript]
tf.user_choice = tf.shuffled[tf.choice_num];
if(tf.user_choice == tf.correct_text){
tf.ans_target = "*ans_correct";
} else {
tf.ans_target = "*ans_wrong";
}
[endscript]

[jump  target="&tf.ans_target"  storage=""  ]

; --- 正解処理 ---


*ans_correct

[iscript]
clearInterval(tf.timer_id);
$(".time_gage").stop();
[endscript]

[eval exp="tf.score++"]


正解！！[p]


[jump  target="*next_question_check"  storage=""  ]

; --- 不正解処理 ---


*ans_wrong

[iscript]
clearInterval(tf.timer_id);
$(".time_gage").stop();
[endscript]

[eval exp="tf.life--"]

[iscript]
if(tf.life < 0){ tf.life = 0; }
[endscript]

[call  target="*show_life"  storage=""  ]

残念、不正解…正解は「[p]


[emb exp="tf.correct_text"]


」でした。[p]


[jump  target="*next_question_check"  storage=""  ]
*next_question_check

[iscript]
clearInterval(tf.timer_id);
if(tf.life <= 0){
tf.next_target = "*game_over";
} else {
tf.next_target = "*go_next";
}
[endscript]


; ▼▼ ここで古い問題文やヒントボタンを完全に消去！ ▼▼


[stopanim name="time_gage"]

[free layer="2" name="time_gage"]

[free layer="2" name="time_cover"]

[free layer="2" name="time_bar_hk"]

[free layer="2" name="question_text"]

[free layer="2" name="hint_btn"]

[jump  target="&tf.next_target"  storage=""  ]
*go_next

[freeimage layer="1"]

[eval exp="tf.current_index++"]

[jump  target="*question_loop"  storage=""  ]

; --- 時間切れ処理 ---


*time_up

[cm  ]
[tb_show_message_window  ]

時間切れ！[p]
残念、不正解…正解を確認して次の問題へ進もう！[p]


[eval exp="tf.life--"]

[call  target="*show_life"  storage=""  ]
[jump  target="*next_question_check"  storage=""  ]

; --- ゲームオーバー処理 ---


*game_over

[free name="time_bar_hk" layer="2"]

[free name="life_heart" layer="2"]

[free layer="2" name="question_text"]

[free layer="2" name="hint_btn"]

[cm  ]
[tb_show_message_window  ]

ゲームオーバー…！[p]


[jump  target="*quiz_end"  storage=""  ]
*quiz_end

[cm  ]
[tb_show_message_window  ]

貴方は10点中 [p]


[emb exp="tf.score"]


点です！[p]


[tb_hide_message_window  ]
[jump  storage="title_screen.ks"  target="*game_end"  ]
