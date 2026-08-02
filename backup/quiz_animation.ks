[_tb_system_call storage=system/_quiz_animation.ks]


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
{q: "第1問", difficulty: "normal", choices: ["『呪術廻戦』で、虎杖悠仁が受肉することになった特級呪物は？", "A.両面宿儺の指", "B.獄門疆", "C.特級過呪怨霊", "D.天逆鉾"], ans: "A"},
{q: "第2問", difficulty: "easy", choices: ["アニメ『ドラえもん』で、ドラえもんが一番大好物な食べ物は何でしょう？", "A.どら焼き", "B.みたらし団子", "C.カレーライス", "D.鉄"], ans: "A"},
{q: "第3問", difficulty: "veryhard", choices: ["『不思議の海のナディア』の原案は？", "A.ジュール・ヴェルヌ", "B.H.G.ウェルズ", "C.エドガー・アラン・ポー", "D.アーサー・コナン・ドイル"], ans: "A"},
{q: "第4問", difficulty: "hard", choices: ["『攻殻機動隊』の主人公、草薙素子の階級は？", "A.少佐", "B.大佐", "C.中佐", "D.軍曹"], ans: "A"},
{q: "第5問", difficulty: "normal", choices: ["『鋼の錬金術師』で、エドワード・エルリックが失った体の部位は？", "A.右腕と左脚", "B.左腕と右脚", "C.両腕", "D.両脚"], ans: "A"},
{q: "第6問", difficulty: "easy", choices: ["『ポケットモンスター』の主人公、サトシの最初の相棒といえば？", "A.ヒトカゲ", "B.ゼニガメ", "C.フシギダネ", "D.ピカチュウ"], ans: "D"},
{q: "第7問", difficulty: "veryhard", choices: ["『魔法少女まどか☆マギカ』の脚本を書いた人物は？", "A.虚淵玄", "B.奈須きのこ", "C.虚空の王", "D.虚数空間"], ans: "A"},
{q: "第8問", difficulty: "hard", choices: ["『うる星やつら』のラムちゃんが乗っている宇宙船のデザインは？", "A.UFO型", "B.円盤型", "C.虎柄のUFO", "D.飛行機型"], ans: "C"},
{q: "第9問", difficulty: "normal", choices: ["『君の名は。』の監督は誰？", "A.宮崎駿", "B.新海誠", "C.細田守", "D.庵野秀明"], ans: "B"},
{q: "第10問", difficulty: "easy", choices: ["『アンパンマン』の作者は誰？", "A.藤子・F・不二雄", "B.やなせたかし", "C.手塚治虫", "D.鳥山明"], ans: "B"},
{q: "第11問", difficulty: "veryhard", choices: ["『輪るピングドラム』の監督は誰？", "A.幾原邦彦", "B.細田守", "C.湯浅政明", "D.今敏"], ans: "A"},
{q: "第12問", difficulty: "hard", choices: ["『機動戦士ガンダム』で、シャア・アズナブルの異名「赤い彗星」の由来は？", "A.機体が赤いから", "B.移動速度が速いから", "C.赤い服を着ているから", "D.シャアが赤いから"], ans: "A"},
{q: "第13問", difficulty: "normal", choices: ["『コードギアス 反逆のルルーシュ』で、主人公ルルーシュが持つ能力は？", "A.写輪眼", "B.ギアス", "C.念能力", "D.個性"], ans: "B"},
{q: "第14問", difficulty: "easy", choices: ["『名探偵コナン』の主人公、江戸川コナンが本来の姿に戻るために追っている組織は？", "A.黒の組織", "B.赤の組織", "C.白の組織", "D.青の組織"], ans: "A"},
{q: "第15問", difficulty: "veryhard", choices: ["『パプリカ』の原作小説を書いた作家は？", "A.筒井康隆", "B.星新一", "C.小松左京", "D.半村良"], ans: "A"},
{q: "第16問", difficulty: "hard", choices: ["『未来少年コナン』で、コナンが住んでいた島は？", "A.のこされ島", "B.インダストリア", "C.ハイハーバー", "D.ラナの島"], ans: "A"},
{q: "第17問", difficulty: "normal", choices: ["『銀魂』で、万事屋のメンバーでないのは？", "A.坂田銀時", "B.志村新八", "C.神楽", "D.土方十四郎"], ans: "D"},
{q: "第18問", difficulty: "easy", choices: ["『となりのトトロ』で、サツキとメイが出会う不思議な生き物は？", "A.ネコバス", "B.トトロ", "C.まっくろくろすけ", "D.すべて正解"], ans: "D"},
{q: "第19問", difficulty: "veryhard", choices: ["『灰羽連盟』の作者は？", "A.安倍吉俊", "B.村田蓮爾", "C.いとうのいぢ", "D.貞本義行"], ans: "A"},
{q: "第20問", difficulty: "hard", choices: ["『BANANA FISH』の舞台である、アッシュ・リンクスが活動拠点とする街は？", "A.ロサンゼルス", "B.ニューヨーク", "C.シカゴ", "D.マイアミ"], ans: "B"},
{q: "第21問", difficulty: "normal", choices: ["『デスノート』で、キラとして活動した主人公の名前は？", "A.夜神月", "B.L", "C.ニア", "D.メロ"], ans: "A"},
{q: "第22問", difficulty: "easy", choices: ["『鬼滅の刃』の主人公、竈門炭治郎が背負っている箱に入っているのは？", "A.刀", "B.妹の禰豆子", "C.食料", "D.本"], ans: "B"},
{q: "第23問", difficulty: "veryhard", choices: ["『ブレンパワード』の監督は誰？", "A.富野由悠季", "B.宮崎駿", "C.高畑勲", "D.押井守"], ans: "A"},
{q: "第24問", difficulty: "hard", choices: ["『寄生獣』の主人公、新一の右手に寄生したミギーの食料は？", "A.肉", "B.野菜", "C.人間", "D.生物の細胞"], ans: "A"},
{q: "第25問", difficulty: "normal", choices: ["『ハイキュー!!』の主人公、日向翔陽が所属する高校のバレーボール部員の特徴は？", "A.強豪校だが弱小", "B.落ちた強豪と呼ばれる", "C.無名の高校", "D.エリートが集まる高校"], ans: "B"},
{q: "第26問", difficulty: "easy", choices: ["『ONE PIECE』で、ルフィが目指している海賊王の称号とは？", "A.世界一の剣豪", "B.海賊王", "C.世界皇帝", "D.大海賊"], ans: "B"},
{q: "第27問", difficulty: "veryhard", choices: ["『地球へ…』の原作者は？", "A.竹宮惠子", "B.萩尾望都", "C.大島弓子", "D.山岸凉子"], ans: "A"},
{q: "第28問", difficulty: "hard", choices: ["『天元突破グレンラガン』で、主人公シモンの相棒であるカミナの武器は？", "A.日本刀", "B.拳銃", "C.ハンマー", "D.ドリル"], ans: "A"},
{q: "第29問", difficulty: "normal", choices: ["『クレヨンしんちゃん』の野原しんのすけの父、ひろしの会社での役職は？", "A.部長", "B.課長", "C.係長", "D.係長代理"], ans: "C"},
{q: "第30問", difficulty: "easy", choices: ["『サザエさん』の磯野家で、一番年上なのは？", "A.波平", "B.フネ", "C.サザエ", "D.カツオ"], ans: "A"},
{q: "第31問", difficulty: "veryhard", choices: ["『星界の紋章』に登場するアーヴ帝国語を作った言語学者は？", "A.森岡浩之（設定）", "B.河野六郎", "C.金田一春彦", "D.言語学教授"], ans: "A"},
{q: "第32問", difficulty: "hard", choices: ["『あしたのジョー』で、矢吹丈の最大のライバルである力石徹の階級は？", "A.バンタム級", "B.フェザー級", "C.ライト級", "D.ウェルター級"], ans: "A"},
{q: "第33問", difficulty: "normal", choices: ["『るろうに剣心』の主人公、緋村剣心の頬にある傷の形は？", "A.丸", "B.×（十字）", "C.一本線", "D.三日月"], ans: "B"},
{q: "第34問", difficulty: "easy", choices: ["『新世紀エヴァンゲリオン』で、主人公・碇シンジが乗る機体は？", "A.エヴァンゲリオン初号機", "B.エヴァンゲリオン零号機", "C.エヴァンゲリオン弐号機", "D.エヴァンゲリオンMark.06"], ans: "A"},
{q: "第35問", difficulty: "veryhard", choices: ["『王立宇宙軍 オネアミスの翼』の製作会社は？", "A.ガイナックス", "B.サンライズ", "C.東映アニメーション", "D.スタジオジブリ"], ans: "A"},
{q: "第36問", difficulty: "hard", choices: ["『MONSTER』の悪役であるヨハン・リーベルトの本籍地は？", "A.東ドイツ", "B.西ドイツ", "C.チェコ", "D.オーストリア"], ans: "A"},
{q: "第37問", difficulty: "normal", choices: ["『ジョジョの奇妙な冒険』の第1部の主人公は？", "A.ジョセフ・ジョースター", "B.空条承太郎", "C.ジョナサン・ジョースター", "D.東方仗助"], ans: "C"},
{q: "第38問", difficulty: "easy", choices: ["『美少女戦士セーラームーン』で、主人公月野うさぎが変身する決め台詞は？", "A.月に代わっておしおきよ！", "B.月に代わって愛を届けるわ！", "C.月のように輝くわ！", "D.月を見て戦うわ！"], ans: "A"},
{q: "第39問", difficulty: "veryhard", choices: ["『AKIRA』の原作漫画が連載されていた雑誌は？", "A.週刊ヤングマガジン", "B.週刊少年ジャンプ", "C.週刊少年サンデー", "D.月刊アフタヌーン"], ans: "A"},
{q: "第40問", difficulty: "hard", choices: ["『宝石の国』で、主人公フォスフォフィライトの硬度は？", "A.3.5", "B.5.5", "C.7", "D.10"], ans: "A"},
{q: "第41問", difficulty: "normal", choices: ["『黒子のバスケ』で、黒子テツヤの元相棒は？", "A.火神大我", "B.青峰大輝", "C.黄瀬涼太", "D.緑間真太郎"], ans: "B"},
{q: "第42問", difficulty: "easy", choices: ["『ドラゴンボール』の主人公、孫悟空が最初に修行した武道家は？", "A.亀仙人", "B.界王様", "C.神様", "D.ウイス"], ans: "A"},
{q: "第43問", difficulty: "veryhard", choices: ["『ルパン三世』の第1シリーズ（緑ジャケット）の演出に関わった人物は？", "A.大塚康生", "B.宮崎駿", "C.高畑勲", "D.すべて正解"], ans: "D"},
{q: "第44問", difficulty: "hard", choices: ["『カウボーイビバップ』の主人公、スパイク・スピーゲルがかつて所属していた組織は？", "A.レッドドラゴン", "B.ホワイトスネイク", "C.ブルーローズ", "D.ブラックフェザー"], ans: "A"},
{q: "第45問", difficulty: "normal", choices: ["『HUNTER×HUNTER』の主人公ゴンの目的は？", "A.金持ちになること", "B.ハンターになること", "C.父親ジンに会うこと", "D.幻影旅団を倒すこと"], ans: "C"},
{q: "第46問", difficulty: "easy", choices: ["『進撃の巨人』の舞台である、人類が居住する壁の名前は？", "A.三重の壁", "B.ウォール・マリア、ローゼ、シーナ", "C.大きな壁", "D.防衛壁"], ans: "B"},
{q: "第47問", difficulty: "veryhard", choices: ["『伝説巨神イデオン』の劇中で登場する、全滅の引き金となるエネルギーは？", "A.イデ", "B.フォース", "C.ゲッター線", "D.アトミカ"], ans: "A"},
{q: "第48問", difficulty: "hard", choices: ["『少女革命ウテナ』で、ウテナが所属する学園の名称は？", "A.鳳学園", "B.星ノ森学園", "C.聖マリア学園", "D.常盤台中学"], ans: "A"},
{q: "第49問", difficulty: "normal", choices: ["『PSYCHO-PASS サイコパス』で、犯罪係数を測定する銃の名前は？", "A.ドミネーター", "B.エリミネーター", "C.サイコガン", "D.ビームサーベル"], ans: "A"},
{q: "第50問", difficulty: "hard", choices: ["『serial experiments lain』の主人公、玲音が最初に使用していたコンピューターは？", "A.iMac", "B.VAIO", "C.NAVI", "D.PC-98"], ans: "C"}
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
tf.current_bg = 'haikei/easy_haikei.png';
} else if(tf.diff == "normal"){
tf.max_life = 3;
tf.time_limit = 60;
tf.current_bg = 'haikei/normal_haikei.png';
} else if(tf.diff == "hard"){
tf.max_life = 2;
tf.time_limit = 60;
tf.current_bg = 'haikei/hard_haikei.png';
} else if(tf.diff == "veryhard"){
tf.max_life = 1;
tf.time_limit = 60;
tf.current_bg = 'haikei/very_hard_haikei.png';
}
tf.life = tf.max_life;
tf.hint_count = 3;
[endscript]

[image layer="base" storage="&tf.current_bg" time="1000"]

[playbgm  storage="bgm1.ogg"  ]
[jump  target="*welcome_scene"  storage=""  ]

; --- ライフ表示 ---


*show_life


; 古いハートの画像をレイヤー2から消去


[free layer="2" name="life_heart"]

[iscript]
// 現在のライフ数に応じて、画像パスを変数にセットするだけ
tf.h1 = (tf.life >= 1) ? "UI/heart1.png" : "UI/heart01.png";
tf.h2 = (tf.life >= 2) ? "UI/heart1.png" : "UI/heart01.png";
tf.h3 = (tf.life >= 3) ? "UI/heart1.png" : "UI/heart01.png";
tf.h4 = (tf.life >= 4) ? "UI/heart1.png" : "UI/heart01.png";
tf.h5 = (tf.life >= 5) ? "UI/heart1.png" : "UI/heart01.png";
[endscript]


; [if]を使わず、cond属性（条件）を満たした時だけ画像を表示する


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
f.chara_img = "chara/" + sf.selected_chara + ".png";
f.voice1 = "voice/" + sf.selected_chara + "/welcome1_" + tf.diff + ".ogg";
f.voice2 = "voice/" + sf.selected_chara + "/welcome2.ogg";
f.voice3 = "voice/" + sf.selected_chara + "/welcome3.ogg";
[endscript]

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
[anim  name="chara_stand"  left="800"  time="1000"  ]
[wa  ]
[freeimage layer="1"]


; --- 4. クイズループ ---


*question_loop


; ▼▼ 10問終わったかの判定を確実に行う ▼▼


[iscript]
if(tf.current_index >= tf.question_count){
tf.loop_next = "*quiz_end";
} else {
tf.loop_next = "*continue_quiz";
}
[endscript]

[jump  target="&tf.loop_next"  storage=""  ]
*continue_quiz


; ▼▼ タイマーの開始処理をここから消し、初期化だけにします ▼▼


[iscript]
tf.time_limit = 60;
tf.time_left = tf.time_limit;
[endscript]

[call  target="*show_life"  storage=""  ]
[iscript]
var q = tf.selected_questions[tf.current_index];
var choices = [q.choices[1], q.choices[2], q.choices[3], q.choices[4]];
for (var k = choices.length - 1; k > 0; k--) {
var m = Math.floor(Math.random() * (k + 1));
var tmp = choices[k];
choices[k] = choices[m];
choices[m] = tmp;
}
tf.shuffled = choices;
var ans_idx = "ABCD".indexOf(q.ans) + 1;
tf.correct_text = q.choices[ans_idx];
tf.hint_used = false;
[endscript]

[cm  ]
[image storage="&f.chara_img" layer="1" x="800" y="50" width="400" name="chara_stand"]

[tb_show_message_window  ]

; --- タイマー表示 ---


[image layer="2" storage="UI/bar_hk.png" x="410" y="70" name="time_bar_hk" width="470" height="70"]

[image layer="2" storage="UI/gage.png" x="410" y="70" name="time_gage" width="470" height="70"]


; ▼▼ time_cover にも name を追加しています ▼▼


[image layer="2" storage="UI/time_cover.png" x="320" y="15" name="time_cover" width="600" height="150"]


第 [p]


[emb exp="tf.current_index+1"]


問：[p]


[emb exp="tf.selected_questions[tf.current_index].choices[0]"]

[p]


; ▼▼ タイマー＆バー連動開始（ヒントを押してもリセットされない位置に配置） ▼▼


[iscript]
tf.timer_id = setInterval(function(){
tf.time_left--;
if(tf.time_left <= 0){
clearInterval(tf.timer_id);
TYRANO.kag.ftag.startTag("jump", {target:"*time_up"});
}
}, 1000);
// アニメーション用に秒数をミリ秒（60秒なら60000）に変換
tf.anim_time = (tf.time_limit + 18) * 1000;
[endscript]


; ▼▼ ゲージを時間いっぱいかけて幅0まで縮めるアニメーション ▼▼


[anim  name="time_gage"  width="0"  time="&tf.anim_time"  ]
*show_choices

[cm  ]
[tb_hide_message_window  ]
[glink  color="black"  target="*check_answer"  text="&tf.shuffled[0]"  size="20"  x="250"  y="250"  width="350"  exp="tf.choice_num=0"  ]
[glink  color="black"  target="*check_answer"  text="&tf.shuffled[1]"  size="20"  x="680"  y="250"  width="350"  exp="tf.choice_num=1"  ]
[glink  color="black"  target="*check_answer"  text="&tf.shuffled[2]"  size="20"  x="250"  y="350"  width="350"  exp="tf.choice_num=2"  ]
[glink  color="black"  target="*check_answer"  text="&tf.shuffled[3]"  size="20"  x="680"  y="350"  width="350"  exp="tf.choice_num=3"  ]

; ▼▼ ヒントボタンの条件判定 ▼▼


[iscript]
if(tf.hint_used == true || tf.hint_count <= 0){
tf.hint_jump = "*skip_hint";
} else {
tf.hint_jump = "*show_hint_button";
}
[endscript]

[jump  target="&tf.hint_jump"  storage=""  ]
*show_hint_button

[glink  color="blue"  target="*use_hint"  text="ヒントを使う"  size="20"  x="980"  y="65"  width="160"  ]
*skip_hint

[s  ]

; --- ヒント処理 ---


*use_hint

[iscript]
var wrong_indices = [];
for(var i=0; i<4; i++){
if(tf.shuffled[i] != tf.correct_text){ wrong_indices.push(i); }
}
tf.shuffled[wrong_indices[0]] = "";
tf.shuffled[wrong_indices[1]] = "";
tf.hint_used = true;
tf.hint_count--;
[endscript]

[jump  target="*show_choices"  storage=""  ]

; --- 5. 判定・終了 ---


*check_answer

[cm  ]
[tb_show_message_window  ]

; ▼▼ 正解判定 ▼▼


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

[eval exp="tf.score++"]


正解！！[p]


[jump  target="*next_question_check"  storage=""  ]

; --- 不正解処理 ---


*ans_wrong

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


; ▼▼ タイマー停止と、ライフ判定 ▼▼


[iscript]
clearInterval(tf.timer_id);
if(tf.life <= 0){
tf.next_target = "*game_over";
} else {
tf.next_target = "*go_next";
}
[endscript]


; ▼▼ アニメーションを停止し、古いゲージとカバー画像を綺麗に消去する ▼▼


[stopanim name="time_gage"]

[free layer="2" name="time_gage"]

[free layer="2" name="time_cover"]

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


[s  ]
