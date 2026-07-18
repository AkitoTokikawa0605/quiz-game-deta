; --- 1. 難易度選択 ---
*difficulty_select
[hidemenubutton]
[cm]
[tb_hide_message_window]
難易度を選んでください！[r]
[glink target="*start_game" text="イージー" x="200" y="200" exp="tf.diff='easy'"]
[glink target="*start_game" text="ノーマル" x="200" y="300" exp="tf.diff='normal'"]
[glink target="*start_game" text="ハード"   x="200" y="400" exp="tf.diff='hard'"]
[s]

; --- 2. ゲーム開始設定 ---
*start_game
[iscript]
tf.all_questions = [
    {q: "第1問", difficulty: "easy", choices: ["アニメ『ドラえもん』で、ドラえもんが一番大好物な食べ物は何でしょう？", "A.どら焼き", "B.みたらし団子", "C.カレーライス", "D.鉄"], ans: "A"},	
    {q: "第2問", difficulty: "easy", choices: ["アニメ『名探偵コナン』の主人公、江戸川コナンの正体は誰でしょう？", "A.毛利小五郎", "B.工藤新一", "C.阿笠博士", "D.怪盗キッド"], ans: "B"},	
    {q: "第3問", difficulty: "easy", choices: ["アニメ『ポケットモンスター』で、主人公サトシの最初のパートナーであるポケモンは何でしょう？", "A.ヒトカゲ", "B.ゼニガメ", "C.フシギダネ", "D.ピカチュウ"], ans: "D"},	
    {q: "第4問", difficulty: "easy", choices: ["アニメ『ONE PIECE』の主人公、モンキー・D・ルフィが食べた「悪魔の実」の名前は何でしょう？", "A.ゴムゴムの実", "B.メラメラの実", "C.バラバラの実", "D.スナスナの実"], ans: "A"},	
    {q: "第5問", difficulty: "easy", choices: ["アニメ『アンパンマン』で、アンパンマンの顔が汚れた時、新しい顔を焼いてくれる人は誰でしょう？", "A.バタコさん", "B.ジャムおじさん", "C.チーズ", "D.メロンパンナ"], ans: "B"},	
    {q: "第6問", difficulty: "normal", choices: ["アニメ『新世紀エヴァンゲリオン』で、主人公の碇シンジが搭乗するロボットの名前は何でしょう？", "A.エヴァンゲリオン零号機", "B.エヴァンゲリオン初号機", "C.エヴァンゲリオン弐号機", "D.エヴァンゲリオン仮設5号機"], ans: "B"},	
    {q: "第7問", difficulty: "easy", choices: ["アニメ『サザエさん』の舞台となっている町はどこでしょう？", "A.世田谷区桜新町", "B.港区麻布十番", "C.杉並区阿佐ヶ谷", "D.練馬区大泉学園"], ans: "A"},	
    {q: "第8問", difficulty: "easy", choices: ["アニメ『鬼滅の刃』の主人公、炭治郎が背負っている箱の中に入っているのは誰でしょう？", "A.善逸", "B.伊之助", "C.禰豆子", "D.カナヲ"], ans: "C"},	
    {q: "第9問", difficulty: "easy", choices: ["アニメ『ドラゴンボール』シリーズで、7つ揃えると願いが叶うアイテムは何でしょう？", "A.ドラゴンボール", "B.四星球", "C.仙豆", "D.ホイポイカプセル"], ans: "A"},	
    {q: "第10問", difficulty: "easy", choices: ["アニメ『ちびまる子ちゃん』の主人公、まる子の本名は何でしょう？", "A.さくら まる子", "B.さくら ももこ", "C.さくら さきこ", "D.さくら あけみ"], ans: "B"},
    {q: "第11問", difficulty: "easy", choices: ["アニメ『となりのトトロ』で、サツキとメイが乗る不思議な乗り物は何？", "A.ネコバス", "B.ホウキ", "C.トトロの背中", "D.ジブリバス"], ans: "A"},
    {q: "第12問", difficulty: "easy", choices: ["アニメ『美少女戦士セーラームーン』の決めゼリフは？", "A.月に代わって反省よ！", "B.月に代わっておしおきよ！", "C.愛と正義のセーラー服！", "D.月に代わって参上！"], ans: "B"},
    {q: "第13問", difficulty: "normal", choices: ["アニメ『進撃の巨人』で人類を守る壁の名前は？", "A.ウォール・ローズ", "B.ウォール・エレン", "C.ウォール・マンガ", "D.ウォール・リヴァイ"], ans: "A"},
    {q: "第14問", difficulty: "easy", choices: ["アニメ『北斗の拳』ケンシロウの決めゼリフは？", "A.お前はもう消えている", "B.お前はもう死んでいる", "C.北斗百裂拳！", "D.さらばだ！"], ans: "B"},
    {q: "第15問", difficulty: "hard", choices: ["アニメ『ルパン三世』のルパンが愛用する車は？", "A.フェラーリ", "B.ベンツ", "C.フィアット", "D.ポルシェ"], ans: "C"},
    {q: "第16問", difficulty: "easy", choices: ["アニメ『クレヨンしんちゃん』で、しんのすけが好きなチョコ味のお菓子は？", "A.チョコボール", "B.チョコビ", "C.チョコチップ", "D.チョコバー"], ans: "B"},
    {q: "第17問", difficulty: "normal", choices: ["アニメ『呪術廻戦』で、虎杖悠仁が受肉している呪霊は？", "A.五条悟", "B.伏黒恵", "C.両面宿儺", "D.真人"], ans: "C"},
    {q: "第18問", difficulty: "normal", choices: ["アニメ『鋼の錬金術師』エドワードの弟の名前は？", "A.アルフォンス", "B.ロイ", "C.マース", "D.ヴァン"], ans: "A"},
    {q: "第19問", difficulty: "easy", choices: ["アニメ『機動戦士ガンダム』でアムロが乗ったのは？", "A.ザク", "B.ガンキャノン", "C.ガンダム", "D.ドム"], ans: "C"},
    {q: "第20問", difficulty: "easy", choices: ["アニメ『タッチ』の達也が甲子園を目指すスポーツは？", "A.サッカー", "B.野球", "C.バスケ", "D.テニス"], ans: "B"},
    {q: "第21問", difficulty: "normal", choices: ["アニメ『銀魂』の坂田銀時が営むお店は？", "A.何でも屋", "B.便利屋", "C.万事屋", "D.よろず屋"], ans: "C"},
    {q: "第22問", difficulty: "easy", choices: ["アニメ『スラムダンク』の桜木花道が所属する部活は？", "A.野球部", "B.サッカー部", "C.バスケットボール部", "D.ラグビー部"], ans: "C"},
    {q: "第23問", difficulty: "normal", choices: ["アニメ『葬送のフリーレン』の主人公の種族は？", "A.人間", "B.ドワーフ", "C.エルフ", "D.魔族"], ans: "C"},
    {q: "第24問", difficulty: "hard", choices: ["アニメ『プリキュア』シリーズ第1作のタイトルは？", "A.プリキュア", "B.ふたりはプリキュア", "C.プリキュア5", "D.ハピネスチャージプリキュア"], ans: "B"},
    {q: "第25問", difficulty: "easy", choices: ["アニメ『けいおん！』の主人公たちが所属する部活は？", "A.美術部", "B.吹奏楽部", "C.軽音部", "D.合唱部"], ans: "C"},
    {q: "第26問", difficulty: "hard", choices: ["アニメ『頭文字D』の藤原拓海が乗る車は？", "A.ハチロク（AE86）", "B.スープラ", "C.GT-R", "D.RX-7"], ans: "A"},
    {q: "第27問", difficulty: "normal", choices: ["アニメ『進撃の巨人』でエレンが所属する兵団は？", "A.駐屯兵団", "B.調査兵団", "C.憲兵団", "D.訓練兵団"], ans: "B"},
    {q: "第28問", difficulty: "normal", choices: ["アニメ『銀河鉄道999』で星野鉄郎と旅をする美女は？", "A.エメラルダス", "B.メーテル", "C.クレア", "D.星野"], ans: "B"},
    {q: "第29問", difficulty: "normal", choices: ["アニメ『転生したらスライムだった件』のリムルの元の姿は？", "A.魔王", "B.勇者", "C.サラリーマン", "D.スライム"], ans: "C"},
    {q: "第30問", difficulty: "hard", choices: ["アニメ『犬夜叉』のヒロイン・かごめが現代から持ってくるお菓子は？", "A.ポテトチップス", "B.カップラーメン", "C.チョコレート", "D.クッキー"], ans: "B"},
    {q: "第31問", difficulty: "easy", choices: ["アニメ『暗殺教室』の先生の愛称は？", "A.殺せんせー", "B.暗殺せんせー", "C.タコせんせー", "D.黄せんせー"], ans: "A"},
    {q: "第32問", difficulty: "hard", choices: ["アニメ『忍たま乱太郎』が通っている学校は？", "A.忍術専門学校", "B.忍術学園", "C.忍者学校", "D.乱太郎学園"], ans: "B"},
    {q: "第33問", difficulty: "normal", choices: ["アニメ『ハイキュー!!』の主人公・日向翔陽の高校は？", "A.音駒高校", "B.青葉城西高校", "C.烏野高校", "D.白鳥沢学園"], ans: "C"},
    {q: "第34問", difficulty: "easy", choices: ["アニメ『SPY×FAMILY』でアーニャが持つ能力は？", "A.予知能力", "B.読心術", "C.飛行能力", "D.瞬間移動"], ans: "B"},
    {q: "第35問", difficulty: "easy", choices: ["アニメ『僕のヒーローアカデミア』緑谷出久のヒーロー名は？", "A.オールマイト", "B.デク", "C.かっちゃん", "D.ミドリ"], ans: "B"},
    {q: "第36問", difficulty: "hard", choices: ["アニメ『シティハンター』で冴羽リョウが使われる言葉は？", "A.もっこり", "B.バズーカ", "C.ごっつぁん", "D.ラブラブ"], ans: "A"},
    {q: "第37問", difficulty: "normal", choices: ["アニメ『カードキャプターさくら』でカードを封印する杖は？", "A.星の杖", "B.封印の杖", "C.マジカル杖", "D.さくらの杖"], ans: "B"},
    {q: "第38問", difficulty: "normal", choices: ["アニメ『黒子のバスケ』の黒子テツヤの得意技は？", "A.シュート", "B.パス", "C.ダンク", "D.ドリブル"], ans: "B"},
    {q: "第39問", difficulty: "easy", choices: ["アニメ『あしたのジョー』の矢吹丈のスポーツは？", "A.野球", "B.柔道", "C.ボクシング", "D.レスリング"], ans: "C"},
    {q: "第40問", difficulty: "hard", choices: ["アニメ『千と千尋の神隠し』で湯婆婆が経営する場所は？", "A.銭湯", "B.ホテル", "C.油屋", "D.温泉旅館"], ans: "C"},
    {q: "第41問", difficulty: "hard", choices: ["アニメ『家庭教師ヒットマンREBORN!』でリボーンの職業は？", "A.殺し屋", "B.ヒットマン", "C.教師", "D.ボディーガード"], ans: "B"},
    {q: "第42問", difficulty: "hard", choices: ["アニメ『七つの大罪』の酒場の名前は？", "A.豚の帽子亭", "B.酒場の豚", "C.大罪の宿", "D.冒険者の酒場"], ans: "A"},
    {q: "第43問", difficulty: "normal", choices: ["アニメ『ジョジョの奇妙な冒険』の特殊能力は？", "A.ハモン", "B.スタンド", "C.魔法", "D.気"], ans: "B"},
    {q: "第44問", difficulty: "normal", choices: ["アニメ『ソードアート・オンライン』のデスゲームの名前は？", "A.ソードアート", "B.オンライン", "C.ソードアート・オンライン", "D.ゲーム・オブ・ソード"], ans: "C"},
    {q: "第45問", difficulty: "hard", choices: ["アニメ『涼宮ハルヒの憂鬱』でハルヒが作った団体は？", "A.SOS団", "B.ハルヒ団", "C.不思議探検隊", "D.部活団"], ans: "A"},
    {q: "第46問", difficulty: "easy", choices: ["アニメ『デスノート』のノートの名前は？", "A.死神ノート", "B.デスノート", "C.殺人ノート", "D.名前ノート"], ans: "B"},
    {q: "第47問", difficulty: "hard", choices: ["アニメ『ヒカルの碁』でヒカルに取り憑くのは？", "A.藤原佐為", "B.平安の棋士", "C.天の声", "D.囲碁の神"], ans: "A"},
    {q: "第48問", difficulty: "hard", choices: ["アニメ『マクロス』シリーズの要素は？", "A.歌とロボットと三角関係", "B.ダンスと剣と恋愛", "C.歌と魔法と友情", "D.ロボットとスポーツと絆"], ans: "A"},
    {q: "第49問", difficulty: "normal", choices: ["アニメ『鋼の錬金術師』の最大のタブーは？", "A.金銀錬成", "B.人体錬成", "C.国家錬成", "D.賢者の石錬成"], ans: "B"},
    {q: "第50問", difficulty: "normal", choices: ["アニメ『Dr.STONE』千空が使う学問は？", "A.物理学", "B.医学", "C.科学", "D.生物学"], ans: "C"},
];
[endscript]
[jump target="*initialize_game"]

; --- 3. 初期化処理 ---
*initialize_game
[iscript]
if(tf.diff == null) tf.diff = "easy";

tf.filtered = tf.all_questions.filter(function(q) {
    var level = q.difficulty || "easy";
    if(tf.diff == "easy") return level == "easy";
    if(tf.diff == "normal") return level == "easy" || level == "normal";
    return true; 
});

// 問題のシャッフル
for (var i = tf.filtered.length - 1; i > 0; i--) {
    var j = Math.floor(Math.random() * (i + 1));
    var temp = tf.filtered[i];
    tf.filtered[i] = tf.filtered[j];
    tf.filtered[j] = temp;
}

// 10問を抽出して変数をリセット
tf.selected_questions = tf.filtered.slice(0, 10);
tf.current_index = 0;
tf.score = 0;
tf.life = 3;
tf.hint_count = 3;
tf.heart_text = "♡♡♡";
tf.hint_text = "残り回数：3回";
[endscript]

; ▼ 難易度ごとの演出分岐 ▼
[if exp="tf.diff == 'easy'"]
    [bg storage="haikei/easy_haikei.png" time="1000"]
    [playbgm storage="easy_bgm.ogg"]

[elsif exp="tf.diff == 'normal'"]
    [bg storage="haikei/normal_haikei.png" time="1000"]
    [playbgm storage="normal_bgm.ogg"]

[elsif exp="tf.diff == 'hard'"]
    [bg storage="haikei/hard_haikei.png" time="1000"]
    [playbgm storage="hard_bgm.ogg"]
[endif]

[jump target="*question_loop"]

; --- 4. クイズループ ---
*question_loop
; ▼ 安全装置：問題が尽きた、または10問終わった場合は結果発表へ飛ぶ ▼
[if exp="tf.current_index >= tf.selected_questions.length || tf.current_index >= 10"]
    [jump target="*quiz_end"]
[endif]

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

[cm]
[tb_show_message_window]
[emb exp="tf.selected_questions[tf.current_index].choices[0]"]
[p]

*show_choices
[cm]
[tb_hide_message_window]

[if exp="tf.shuffled[0] != ''"]
    [glink color="black" target="*check_answer" text="&tf.shuffled[0]" size="20" x="250" y="250" width="350" exp="tf.user_choice=tf.shuffled[0]"]
[endif]

[if exp="tf.shuffled[1] != ''"]
    [glink color="black" target="*check_answer" text="&tf.shuffled[1]" size="20" x="680" y="250" width="350" exp="tf.user_choice=tf.shuffled[1]"]
[endif]

[if exp="tf.shuffled[2] != ''"]
    [glink color="black" target="*check_answer" text="&tf.shuffled[2]" size="20" x="250" y="350" width="350" exp="tf.user_choice=tf.shuffled[2]"]
[endif]

[if exp="tf.shuffled[3] != ''"]
    [glink color="black" target="*check_answer" text="&tf.shuffled[3]" size="20" x="680" y="350" width="350" exp="tf.user_choice=tf.shuffled[3]"]
[endif]

[if exp="tf.hint_used == false && tf.hint_count > 0"]
    [glink color="blue" target="*use_hint" text="ヒントを使う" size="20" x="980" y="65" width="160"]
[endif]
[s]

*use_hint
[iscript]
var wrong_indices = [];
for(var i=0; i<4; i++){
    if(tf.shuffled[i] != tf.correct_text){
        wrong_indices.push(i);
    }
}
tf.shuffled[wrong_indices[0]] = "";
tf.shuffled[wrong_indices[1]] = "";
tf.hint_used = true;
tf.hint_count = tf.hint_count - 1;
tf.hint_text = "残り回数：" + tf.hint_count + "回";
[endscript]
[jump target="*show_choices"]


; --- 5. 判定・終了 ---
*check_answer
[cm]
[tb_show_message_window]
[if exp="tf.user_choice == tf.correct_text"]
    [iscript]
    tf.score = tf.score + 1;
    [endscript]
    正解！！[p]
[else]
    [iscript]
    tf.life = tf.life - 1;
    if(tf.life < 0) tf.life = 0;
    tf.heart_text = "♡".repeat(tf.life);
    [endscript]
    
    ; ▼ UI更新：減ったハートを画面に反映させる ▼
    [free name="heart_ui" layer="1"]
    [ptext layer="1" page="fore" text="&tf.heart_text" size="30" x="50" y="55" color="0xFF6699" name="heart_ui"]

    残念、不正解…正解は「[emb exp="tf.correct_text"]」でした。[p]
[endif]

[if exp="tf.life <= 0"]
    [jump target="*game_over"]
[endif]

[iscript]
tf.current_index = tf.current_index + 1;
[endscript]
[jump target="*question_loop"]

*game_over
[cm]
; ▼ 終了時にUIを綺麗に消す ▼
[free name="heart_ui" layer="1"]
[free name="life_title" layer="1"]
[free name="hint_ui" layer="1"]
[tb_show_message_window]
ゲームオーバー…！[p]
[s]

*quiz_end
[cm]
[free name="heart_ui" layer="1"]
[free name="life_title" layer="1"]
[free name="hint_ui" layer="1"]
[tb_show_message_window]
貴方は10点中 [emb exp="tf.score"] 点です！[p]
[s]
