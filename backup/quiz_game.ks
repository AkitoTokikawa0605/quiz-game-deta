[_tb_system_call storage=system/_game_quiz.ks]


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
{q: "第1問", difficulty: "easy", choices: ["『スーパーマリオブラザーズ』で、マリオの双子の弟の名前は？", "A.ルイージ", "B.ワリオ", "C.ワルイージ", "D.ヨッシー"], ans: "A"},
{q: "第2問", difficulty: "normal", choices: ["『逆転裁判』シリーズで、主人公が証言の矛盾を指摘する時の決め台詞は？", "A.待った！", "B.異議あり！", "C.くらえ！", "D.見つけた！"], ans: "B"},
{q: "第3問", difficulty: "veryhard", choices: ["『ドラゴンクエストV 天空の花嫁』で、主人公の父親であるパパスの最期に現れた魔族は？", "A.ゲマ", "B.ブオーン", "C.ミルドラース", "D.イブール"], ans: "A"},
{q: "第4問", difficulty: "hard", choices: ["『ゼルダの伝説』シリーズで、ゼルダ姫が収めている王国の名前は？", "A.ハイラル", "B.ガノン", "C.コキリ", "D.スカイロフト"], ans: "A"},
{q: "第5問", difficulty: "easy", choices: ["『ポケットモンスター』シリーズで、ピカチュウが進化すると何になる？", "A.ピチュー", "B.ライチュウ", "C.プラスル", "D.マイナン"], ans: "B"},
{q: "第6問", difficulty: "hard", choices: ["『メタルギアソリッド』の主人公ソリッド・スネークの生みの親とも言えるゲームクリエイターは？", "A.小島秀夫", "B.宮本茂", "C.坂口博信", "D.桜井政博"], ans: "A"},
{q: "第7問", difficulty: "normal", choices: ["『Minecraft（マインクラフト）』で、最も基本的なブロック素材といえば？", "A.ダイヤモンド", "B.土", "C.黒曜石", "D.鉄"], ans: "B"},
{q: "第8問", difficulty: "veryhard", choices: ["『Bloodborne』で、プレイヤーが経験値の代わりに集める通貨の名前は？", "A.ソウル", "B.血の遺志", "C.ルーン", "D.銭"], ans: "B"},
{q: "第9問", difficulty: "hard", choices: ["『ファイナルファンタジーVII』の主人公クラウドが装備している巨大な剣の名前は？", "A.バスターソード", "B.ガンブレード", "C.エクスカリバー", "D.正宗"], ans: "A"},
{q: "第10問", difficulty: "normal", choices: ["『スプラトゥーン』シリーズで、イカがインクを塗る主な目的は？", "A.敵を倒すため", "B.ナワバリを広げるため", "C.服を汚すため", "D.お金を稼ぐため"], ans: "B"},
{q: "第11問", difficulty: "easy", choices: ["『星のカービィ』の主人公カービィの最大の特技は？", "A.剣を振るう", "B.敵を吸い込んでコピーする", "C.火を吹く", "D.魔法を使う"], ans: "B"},
{q: "第12問", difficulty: "veryhard", choices: ["『ニーア オートマタ』で、2Bや9Sが所属する組織の名前は？", "A.YoRHa（ヨルハ）", "B.特務機関NERV", "C.SEED", "D.神羅カンパニー"], ans: "A"},
{q: "第13問", difficulty: "hard", choices: ["『ストリートファイター』シリーズで、リュウとケンの師匠の名前は？", "A.豪鬼", "B.剛拳", "C.ベガ", "D.サガット"], ans: "B"},
{q: "第14問", difficulty: "normal", choices: ["『Among Us』のゲームの目的は、乗組員（クルー）と誰を見つけること？", "A.王様", "B.インポスター（詐欺師）", "C.医者", "D.警察"], ans: "B"},
{q: "第15問", difficulty: "easy", choices: ["『ソニック・ザ・ヘッジホッグ』の主人公ソニックの色は？", "A.赤", "B.青", "C.黄色", "D.緑"], ans: "B"},
{q: "第16問", difficulty: "veryhard", choices: ["『クロノ・トリガー』で、未来の世界で手に入るタイムマシンの名前は？", "A.シルバード", "B.エポック", "C.ラヴォス", "D.マザー"], ans: "B"},
{q: "第17問", difficulty: "normal", choices: ["『原神』の冒険の舞台となる世界の名前は？", "A.テイワット", "B.セレスティア", "C.稲妻", "D.モンド"], ans: "A"},
{q: "第18問", difficulty: "hard", choices: ["『バイオハザード』シリーズに登場する、物語の元凶ともいえる製薬会社は？", "A.アンブレラ社", "B.アークレイ社", "C.ラクーン社", "D.U.B.S社"], ans: "A"},
{q: "第19問", difficulty: "easy", choices: ["『パックマン』のゲーム画面に登場する敵（ゴースト）の数は基本何匹？", "A.1匹", "B.2匹", "C.4匹", "D.8匹"], ans: "C"},
{q: "第20問", difficulty: "veryhard", choices: ["『ダークソウル』シリーズで、太陽の戦士ソラールが信仰しているものは？", "A.太陽", "B.月", "C.闇", "D.火"], ans: "A"},
{q: "第21問", difficulty: "normal", choices: ["『ペルソナ5』の主人公が怪盗団として活動する際のコードネームは？", "A.ジョーカー", "B.スカル", "C.パンサー", "D.クイーン"], ans: "A"},
{q: "第22問", difficulty: "hard", choices: ["『デビルメイクライ』シリーズの主人公ダンテの兄の名前は？", "A.バージル", "B.ネロ", "C.スパーダ", "D.トリッシュ"], ans: "A"},
{q: "第23問", difficulty: "easy", choices: ["『どうぶつの森』シリーズに登場する、無人島生活のサポートをしてくれるタヌキは？", "A.たぬきち", "B.まめきち", "C.つぶきち", "D.ケント"], ans: "A"},
{q: "第24問", difficulty: "veryhard", choices: ["『Undertale』のサンズ戦で、彼の攻撃が回避される理由は？", "A.彼が素早いから", "B.彼が特殊な攻撃だから", "C.彼が魔法を使っているから", "D.彼が壁に隠れているから"], ans: "A"},
{q: "第25問", difficulty: "normal", choices: ["『God of War』シリーズの主人公、スパルタの亡霊と呼ばれる男は？", "A.クレイトス", "B.アトレウス", "C.オーディン", "D.ゼウス"], ans: "A"},
{q: "第26問", difficulty: "hard", choices: ["『ファイアーエムブレム 暗黒竜と光の剣』の主人公マルスの剣の名前は？", "A.ファルシオン", "B.ラグネル", "C.ティルヴィング", "D.聖剣エクスカリバー"], ans: "A"},
{q: "第27問", difficulty: "easy", choices: ["『フォートナイト』のジャンルは？", "A.バトルロイヤル", "B.シミュレーション", "C.恋愛アドベンチャー", "D.パズル"], ans: "A"},
{q: "第28問", difficulty: "veryhard", choices: ["『サイレントヒル2』で、初めて登場したクリーチャー「三角頭」の正式名称は？", "A.ピラミッドヘッド", "B.レッドピラミッドシング", "C.ブッチャー", "D.バブルヘッドナース"], ans: "B"},
{q: "第29問", difficulty: "normal", choices: ["『モンスターハンター』で、最初に戦うことが多い飛竜種の代表格は？", "A.リオレウス", "B.ティガレックス", "C.ナルガクルガ", "D.ラージャン"], ans: "A"},
{q: "第30問", difficulty: "hard", choices: ["『キングダムハーツ』で、主人公ソラが持つ剣のような武器の名前は？", "A.キーブレード", "B.ライトセーバー", "C.スターライト", "D.ハートブレード"], ans: "A"},
{q: "第31問", difficulty: "easy", choices: ["『マリオカート』で、1位を追尾して攻撃するアイテムは？", "A.赤こうら", "B.緑こうら", "C.トゲゾーこうら", "D.バナナ"], ans: "C"},
{q: "第32問", difficulty: "veryhard", choices: ["『Half-Life』の主人公ゴードン・フリーマンが常に持ち歩いている象徴的な武器は？", "A.バール", "B.ショットガン", "C.弓", "D.レーザーガン"], ans: "A"},
{q: "第33問", difficulty: "normal", choices: ["『Fallout』シリーズの舞台は、どんな世界？", "A.魔法世界", "B.核戦争後の荒廃した世界", "C.未来の宇宙都市", "D.中世ヨーロッパ"], ans: "B"},
{q: "第34問", difficulty: "hard", choices: ["『ゼノブレイド』の主人公シュルクが持つ神剣の名前は？", "A.モナド", "B.エクスカリバー", "C.ラグナロク", "D.ホーリーソード"], ans: "A"},
{q: "第35問", difficulty: "easy", choices: ["『太鼓の達人』で、太鼓を叩いて演奏するゲームのジャンルは？", "A.リズムゲーム", "B.アクション", "C.シューティング", "D.格闘"], ans: "A"},
{q: "第36問", difficulty: "veryhard", choices: ["『F-ZERO』シリーズの主人公キャプテン・ファルコンが操縦するマシンの名前は？", "A.ブルーファルコン", "B.ファイアスティンガー", "C.ゴールデンフォックス", "D.ワイルドグース"], ans: "A"},
{q: "第37問", difficulty: "normal", choices: ["『龍が如く』シリーズの主人公、桐生一馬の異名は？", "A.堂島の龍", "B.新宿の虎", "C.神室町の狼", "D.大阪の鷹"], ans: "A"},
{q: "第38問", difficulty: "hard", choices: ["『ペルソナ3』で、ペルソナを召喚するために使う銃のような道具は？", "A.召喚器（エボーカー）", "B.起動銃", "C.ペルソナ銃", "D.デビルバスター"], ans: "A"},
{q: "第39問", difficulty: "easy", choices: ["『テトリス』の目的は？", "A.ブロックを積み上げる", "B.ブロックを消す", "C.ブロックを壊す", "D.ブロックを飛ばす"], ans: "B"},
{q: "第40問", difficulty: "veryhard", choices: ["『Slay the Spire』の最初のキャラクター「アイアンクラッド」の初期レリックは？", "A.バーニング・ブラッド", "B.賢者の石", "C.ネオーの祝福", "D.スネッコアイ"], ans: "A"},
{q: "第41問", difficulty: "normal", choices: ["『ストリートファイターII』で、ガイルのステージで流れるBGMは何にでも合うとネットで有名になったが、彼の出身国は？", "A.アメリカ", "B.日本", "C.イギリス", "D.フランス"], ans: "A"},
{q: "第42問", difficulty: "hard", choices: ["『地球防衛軍』シリーズで、プレイヤーが戦う巨大な敵の正体は？", "A.巨大生物（虫）", "B.エイリアン", "C.ロボット", "D.ゾンビ"], ans: "A"},
{q: "第43問", difficulty: "easy", choices: ["『トゥームレイダー』の主人公といえば？", "A.ララ・クロフト", "B.エリス", "C.ジル", "D.クレア"], ans: "A"},
{q: "第44問", difficulty: "veryhard", choices: ["『Outer Wilds』で、太陽が超新星爆発を起こすまでの制限時間は？", "A.22分", "B.10分", "C.30分", "D.60分"], ans: "A"},
{q: "第45問", difficulty: "normal", choices: ["『桃太郎電鉄』シリーズの目的は、目的地に到着して何を増やすこと？", "A.資産（総資産）", "B.仲間", "C.体力", "D.経験値"], ans: "A"},
{q: "第46問", difficulty: "hard", choices: ["『ロックマン』シリーズで、各ステージのボスとして登場するロボットの総称は？", "A.ボスロボット", "B.ロボットマスター", "C.ワイリーナンバーズ", "D.イレギュラー"], ans: "B"},
{q: "第47問", difficulty: "easy", choices: ["『クラッシュ・バンディクー』の主人公は何の動物？", "A.バンディクー", "B.キツネ", "C.タヌキ", "D.サル"], ans: "A"},
{q: "第48問", difficulty: "veryhard", choices: ["『アトラス』の『真・女神転生』シリーズで、悪魔合体を行う場所は？", "A.邪教の館", "B.悪魔の家", "C.合成所", "D.ベルベットルーム"], ans: "A"},
{q: "第49問", difficulty: "normal", choices: ["『リーグ・オブ・レジェンド』などで知られるゲームジャンルは？", "A.MOBA", "B.FPS", "C.TPS", "D.MMORPG"], ans: "A"},
{q: "第50問", difficulty: "hard", choices: ["『Stardew Valley』で、町の人々が集まる復興を目指す場所は？", "A.公民館（Community Center）", "B.市役所", "C.教会", "D.図書館"], ans: "A"}
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
