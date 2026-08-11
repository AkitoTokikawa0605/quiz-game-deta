[_tb_system_call storage=system/_ippannzatugaku_quiz.ks]


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
{q: "第1問", difficulty: "easy", choices: ["日本の首都はどこでしょう？", "A.大阪", "B.京都", "C.東京", "D.名古屋"], ans: "C"},
{q: "第2問", difficulty: "easy", choices: ["太陽系で最も大きい惑星はどれでしょう？", "A.火星", "B.地球", "C.土星", "D.木星"], ans: "D"},
{q: "第3問", difficulty: "normal", choices: ["世界で一番面積が広い国はどこでしょう？", "A.中国", "B.ロシア", "C.カナダ", "D.アメリカ"], ans: "B"},
{q: "第4問", difficulty: "hard", choices: ["「銀」の元素記号は？", "A.Au", "B.Ag", "C.Fe", "D.Cu"], ans: "B"},
{q: "第5問", difficulty: "veryhard", choices: ["世界で最も長い川はどれでしょう？", "A.アマゾン川", "B.ナイル川", "C.長江", "D.ミシシッピ川"], ans: "B"},
{q: "第6問", difficulty: "easy", choices: ["水は何度で沸騰するでしょう（1気圧下）？", "A.80℃", "B.90℃", "C.100℃", "D.110℃"], ans: "C"},
{q: "第7問", difficulty: "normal", choices: ["フランスの首都は？", "A.ベルリン", "B.ロンドン", "C.パリ", "D.ローマ"], ans: "C"},
{q: "第8問", difficulty: "hard", choices: ["「ハムレット」の作者は誰？", "A.ゲーテ", "B.シェイクスピア", "C.ドストエフスキー", "D.ヘミングウェイ"], ans: "B"},
{q: "第9問", difficulty: "veryhard", choices: ["江戸幕府の最後の将軍は？", "A.徳川家康", "B.徳川家光", "C.徳川慶喜", "D.徳川綱吉"], ans: "C"},
{q: "第10問", difficulty: "easy", choices: ["おにぎりの具として一番定番なのは？", "A.梅干し", "B.チョコ", "C.バナナ", "D.石"], ans: "A"},
{q: "第11問", difficulty: "normal", choices: ["人間が1日に必要な平均睡眠時間の目安は？", "A.2時間", "B.8時間", "C.15時間", "D.20時間"], ans: "B"},
{q: "第12問", difficulty: "hard", choices: ["世界遺産を最も多く保有する国はどこでしょう（2025年時点上位）？", "A.イタリア", "B.日本", "C.エジプト", "D.ギリシャ"], ans: "A"},
{q: "第13問", difficulty: "veryhard", choices: ["「モナ・リザ」を描いた人物は？", "A.ゴッホ", "B.ピカソ", "C.レオナルド・ダ・ヴィンチ", "D.ミケランジェロ"], ans: "C"},
{q: "第14問", difficulty: "easy", choices: ["1年は何ヶ月あるでしょう？", "A.10ヶ月", "B.11ヶ月", "C.12ヶ月", "D.13ヶ月"], ans: "C"},
{q: "第15問", difficulty: "normal", choices: ["日本で一番高い山は？", "A.北岳", "B.富士山", "C.奥穂高岳", "D.間ノ岳"], ans: "B"},
{q: "第16問", difficulty: "hard", choices: ["元素記号「O」は何を表す？", "A.金", "B.酸素", "C.水素", "D.鉄"], ans: "B"},
{q: "第17問", difficulty: "veryhard", choices: ["ピラミッドがある国は？", "A.メキシコ", "B.エジプト", "C.ブラジル", "D.中国"], ans: "B"},
{q: "第18問", difficulty: "easy", choices: ["ウサギの耳が長い理由は？", "A.音をよく聞くため", "B.体温調節のため", "C.飛ぶため", "D.威嚇するため"], ans: "B"},
{q: "第19問", difficulty: "normal", choices: ["「三権分立」に含まれないものは？", "A.立法", "B.行政", "C.司法", "D.軍事"], ans: "D"},
{q: "第20問", difficulty: "hard", choices: ["夏目漱石の代表作ではないのは？", "A.こころ", "B.坊っちゃん", "C.吾輩は猫である", "D.人間失格"], ans: "D"},
{q: "第21問", difficulty: "veryhard", choices: ["地球の自転の向きは？", "A.東から西", "B.西から東", "C.南から北", "D.北から南"], ans: "B"},
{q: "第22問", difficulty: "easy", choices: ["信号機の色で「止まれ」は？", "A.青", "B.黄", "C.赤", "D.緑"], ans: "C"},
{q: "第23問", difficulty: "normal", choices: ["日本の現在の元号は？", "A.平成", "B.昭和", "C.令和", "D.大正"], ans: "C"},
{q: "第24問", difficulty: "hard", choices: ["オリンピックのマーク、輪の数はいくつ？", "A.3", "B.4", "C.5", "D.6"], ans: "C"},
{q: "第25問", difficulty: "veryhard", choices: ["大西洋と太平洋をつなぐ運河は？", "A.スエズ運河", "B.パナマ運河", "C.キール運河", "D.コリント運河"], ans: "B"},
{q: "第26問", difficulty: "easy", choices: ["リンゴが赤い理由は？", "A.アントシアニン", "B.クロロフィル", "C.カロテン", "D.ビタミンC"], ans: "A"},
{q: "第27問", difficulty: "normal", choices: ["クジラは哺乳類である、〇か×か？", "A.〇", "B.×"], ans: "A"},
{q: "第28問", difficulty: "hard", choices: ["「パンダ」の主食は？", "A.お肉", "B.笹・竹", "C.魚", "D.昆虫"], ans: "B"},
{q: "第29問", difficulty: "veryhard", choices: ["地球の表面の約何％が海？", "A.50％", "B.70％", "C.80％", "D.90％"], ans: "B"},
{q: "第30問", difficulty: "easy", choices: ["太陽が昇る方角は？", "A.北", "B.南", "C.東", "D.西"], ans: "C"},
{q: "第31問", difficulty: "normal", choices: ["「ありがとう」を英語で言うと？", "A.Hello", "B.Good bye", "C.Thank you", "D.Sorry"], ans: "C"},
{q: "第32問", difficulty: "hard", choices: ["日本で一番長い川は？", "A.利根川", "B.信濃川", "C.石狩川", "D.北上川"], ans: "B"},
{q: "第33問", difficulty: "veryhard", choices: ["太陽系で最も太陽に近い惑星は？", "A.金星", "B.地球", "C.水星", "D.火星"], ans: "C"},
{q: "第34問", difficulty: "easy", choices: ["ピアノの鍵盤の数は、一般的なフルサイズでいくつ？", "A.76", "B.88", "C.96", "D.100"], ans: "B"},
{q: "第35問", difficulty: "normal", choices: ["日本三大名園の一つに含まれないのは？", "A.兼六園", "B.後楽園", "C.偕楽園", "D.足立美術館"], ans: "D"},
{q: "第36問", difficulty: "hard", choices: ["「千」という漢字の書き順は、何画目が最後？", "A.1画目", "B.2画目", "C.3画目", "D.4画目"], ans: "C"},
{q: "第37問", difficulty: "veryhard", choices: ["世界一小さい国は？", "A.モナコ", "B.バチカン市国", "C.ナウル", "D.サンマリノ"], ans: "B"},
{q: "第38問", difficulty: "easy", choices: ["「猫」を英語で言うと？", "A.Dog", "B.Cat", "C.Bird", "D.Fish"], ans: "B"},
{q: "第39問", difficulty: "normal", choices: ["1000円札の顔は誰？", "A.福沢諭吉", "B.野口英世", "C.北里柴三郎", "D.樋口一葉"], ans: "C"},
{q: "第40問", difficulty: "hard", choices: ["「青信号」は実際には何色に近い？", "A.真っ青", "B.緑", "C.水色", "D.紫"], ans: "B"},
{q: "第41問", difficulty: "veryhard", choices: ["「ノーベル賞」の賞の種類に含まれないのは？", "A.物理学賞", "B.数学賞", "C.平和賞", "D.文学賞"], ans: "B"},
{q: "第42問", difficulty: "easy", choices: ["アイスクリームの主原料は？", "A.牛乳・生クリーム", "B.醤油", "C.味噌", "D.油"], ans: "A"},
{q: "第43問", difficulty: "normal", choices: ["日本の国花は桜と何？", "A.菊", "B.梅", "C.百合", "D.薔薇"], ans: "A"},
{q: "第44問", difficulty: "hard", choices: ["「マグマ」が地表に出たものは何？", "A.溶岩", "B.火山灰", "C.軽石", "D.火砕流"], ans: "A"},
{q: "第45問", difficulty: "veryhard", choices: ["「地球温暖化」の原因とされる主な気体は？", "A.酸素", "B.窒素", "C.二酸化炭素", "D.ヘリウム"], ans: "C"},
{q: "第46問", difficulty: "easy", choices: ["「一石二鳥」の意味は？", "A.一つの石で二羽の鳥を捕らえる", "B.鳥を二羽飼う", "C.石を投げる", "D.二羽の鳥がケンカする"], ans: "A"},
{q: "第47問", difficulty: "normal", choices: ["東京タワーの高さは？", "A.333m", "B.634m", "C.450m", "D.200m"], ans: "A"},
{q: "第48問", difficulty: "hard", choices: ["ベートーヴェンの有名な交響曲は？", "A.「運命」", "B.「春」", "C.「くるみ割り人形」", "D.「アイネ・クライネ・ナハトムジーク」"], ans: "A"},
{q: "第49問", difficulty: "veryhard", choices: ["世界で最も人口が多い国は（2023年以降の推計）？", "A.中国", "B.アメリカ", "C.インド", "D.インドネシア"], ans: "C"},
{q: "第50問", difficulty: "normal", choices: ["「寿司」の語源は？", "A.酸っぱい", "B.酢を使う", "C.魚をすする", "D.寿司屋がある"], ans: "A"}
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
