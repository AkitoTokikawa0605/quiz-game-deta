; --- 初期設定：問題リストと変数の準備 ---
[iscript]
tf.current_index = 0;
tf.score = 0;
tf.life = 3;             
tf.heart_text = "♡♡♡"; 
tf.hint_count = 3;       
tf.hint_text = "残り回数：" + tf.hint_count + "回"; // ★追加：ヒントのテキスト
[endscript]

[iscript]
tf.all_questions = [
    {q: "第1問", choices: ["アニメ『ドラえもん』で、ドラえもんが一番大好物な食べ物は何でしょう？", "A.どら焼き", "B.みたらし団子", "C.カレーライス", "D.鉄"], ans: "A"},	
    {q: "第2問", choices: ["アニメ『名探偵コナン』の主人公、江戸川コナンの正体は誰でしょう？", "A.毛利小五郎", "B.工藤新一", "C.阿笠博士", "D.怪盗キッド"], ans: "B"},	
    {q: "第3問", choices: ["アニメ『ポケットモンスター』で、主人公サトシの最初のパートナーであるポケモンは何でしょう？", "A.ヒトカゲ", "B.ゼニガメ", "C.フシギダネ", "D.ピカチュウ"], ans: "D"},	
    {q: "第4問", choices: ["アニメ『ONE PIECE』の主人公、モンキー・D・ルフィが食べた「悪魔の実」の名前は何でしょう？", "A.ゴムゴムの実", "B.メラメラの実", "C.バラバラの実", "D.スナスナの実"], ans: "A"},	
    {q: "第5問", choices: ["アニメ『アンパンマン』で、アンパンマンの顔が汚れた時、新しい顔を焼いてくれる人は誰でしょう？", "A.バタコさん", "B.ジャムおじさん", "C.チーズ", "D.メロンパンナ"], ans: "B"},	
    {q: "第6問", choices: ["アニメ『新世紀エヴァンゲリオン』で、主人公の碇シンジが搭乗するロボットの名前は何でしょう？", "A.エヴァンゲリオン零号機", "B.エヴァンゲリオン初号機", "C.エヴァンゲリオン弐号機", "D.エヴァンゲリオン仮設5号機"], ans: "B"},	
    {q: "第7問", choices: ["アニメ『サザエさん』の舞台となっている町はどこでしょう？", "A.世田谷区桜新町", "B.港区麻布十番", "C.杉並区阿佐ヶ谷", "D.練馬区大泉学園"], ans: "A"},	
    {q: "第8問", choices: ["アニメ『鬼滅の刃』の主人公、炭治郎が背負っている箱の中に入っているのは誰でしょう？", "A.善逸", "B.伊之助", "C.禰豆子", "D.カナヲ"], ans: "C"},	
    {q: "第9問", choices: ["アニメ『ドラゴンボール』シリーズで、7つ揃えると願いが叶うアイテムは何でしょう？", "A.ドラゴンボール", "B.四星球", "C.仙豆", "D.ホイポイカプセル"], ans: "A"},	
    {q: "第10問", choices: ["アニメ『ちびまる子ちゃん』の主人公、まる子の本名は何でしょう？", "A.さくら まる子", "B.さくら ももこ", "C.さくら さきこ", "D.さくら あけみ"], ans: "B"},
    {q: "第11問", choices: ["アニメ『となりのトトロ』で、サツキとメイが乗る不思議な乗り物は何？", "A.ネコバス", "B.ホウキ", "C.トトロの背中", "D.ジブリバス"], ans: "A"},
    {q: "第12問", choices: ["アニメ『美少女戦士セーラームーン』の決めゼリフは？", "A.月に代わって反省よ！", "B.月に代わっておしおきよ！", "C.愛と正義のセーラー服！", "D.月に代わって参上！"], ans: "B"},
    {q: "第13問", choices: ["アニメ『進撃の巨人』で人類を守る壁の名前は？", "A.ウォール・ローズ", "B.ウォール・エレン", "C.ウォール・マンガ", "D.ウォール・リヴァイ"], ans: "A"},
    {q: "第14問", choices: ["アニメ『北斗の拳』ケンシロウの決めゼリフは？", "A.お前はもう消えている", "B.お前はもう死んでいる", "C.北斗百裂拳！", "D.さらばだ！"], ans: "B"},
    {q: "第15問", choices: ["アニメ『ルパン三世』のルパンが愛用する車は？", "A.フェラーリ", "B.ベンツ", "C.フィアット", "D.ポルシェ"], ans: "C"},
    {q: "第16問", choices: ["アニメ『クレヨンしんちゃん』で、しんのすけが好きなチョコ味のお菓子は？", "A.チョコボール", "B.チョコビ", "C.チョコチップ", "D.チョコバー"], ans: "B"},
    {q: "第17問", choices: ["アニメ『呪術廻戦』で、虎杖悠仁が受肉している呪霊は？", "A.五条悟", "B.伏黒恵", "C.両面宿儺", "D.真人"], ans: "C"},
    {q: "第18問", choices: ["アニメ『鋼の錬金術師』エドワードの弟の名前は？", "A.アルフォンス", "B.ロイ", "C.マース", "D.ヴァン"], ans: "A"},
    {q: "第19問", choices: ["アニメ『機動戦士ガンダム』でアムロが乗ったのは？", "A.ザク", "B.ガンキャノン", "C.ガンダム", "D.ドム"], ans: "C"},
    {q: "第20問", choices: ["アニメ『タッチ』の達也が甲子園を目指すスポーツは？", "A.サッカー", "B.野球", "C.バスケ", "D.テニス"], ans: "B"},
    {q: "第21問", choices: ["アニメ『銀魂』の坂田銀時が営むお店は？", "A.何でも屋", "B.便利屋", "C.万事屋", "D.よろず屋"], ans: "C"},
    {q: "第22問", choices: ["アニメ『スラムダンク』の桜木花道が所属する部活は？", "A.野球部", "B.サッカー部", "C.バスケットボール部", "D.ラグビー部"], ans: "C"},
    {q: "第23問", choices: ["アニメ『葬送のフリーレン』の主人公の種族は？", "A.人間", "B.ドワーフ", "C.エルフ", "D.魔族"], ans: "C"},
    {q: "第24問", choices: ["アニメ『プリキュア』シリーズ第1作のタイトルは？", "A.プリキュア", "B.ふたりはプリキュア", "C.プリキュア5", "D.ハピネスチャージプリキュア"], ans: "B"},
    {q: "第25問", choices: ["アニメ『けいおん！』の主人公たちが所属する部活は？", "A.美術部", "B.吹奏楽部", "C.軽音部", "D.合唱部"], ans: "C"},
    {q: "第26問", choices: ["アニメ『頭文字D』の藤原拓海が乗る車は？", "A.ハチロク（AE86）", "B.スープラ", "C.GT-R", "D.RX-7"], ans: "A"},
    {q: "第27問", choices: ["アニメ『進撃の巨人』でエレンが所属する兵団は？", "A.駐屯兵団", "B.調査兵団", "C.憲兵団", "D.訓練兵団"], ans: "B"},
    {q: "第28問", choices: ["アニメ『銀河鉄道999』で星野鉄郎と旅をする美女は？", "A.エメラルダス", "B.メーテル", "C.クレア", "D.星野"], ans: "B"},
    {q: "第29問", choices: ["アニメ『転生したらスライムだった件』のリムルの元の姿は？", "A.魔王", "B.勇者", "C.サラリーマン", "D.スライム"], ans: "C"},
    {q: "第30問", choices: ["アニメ『犬夜叉』のヒロイン・かごめが現代から持ってくるお菓子は？", "A.ポテトチップス", "B.カップラーメン", "C.チョコレート", "D.クッキー"], ans: "B"},
    {q: "第31問", choices: ["アニメ『暗殺教室』の先生の愛称は？", "A.殺せんせー", "B.暗殺せんせー", "C.タコせんせー", "D.黄せんせー"], ans: "A"},
    {q: "第32問", choices: ["アニメ『忍たま乱太郎』が通っている学校は？", "A.忍術専門学校", "B.忍術学園", "C.忍者学校", "D.乱太郎学園"], ans: "B"},
    {q: "第33問", choices: ["アニメ『ハイキュー!!』の主人公・日向翔陽の高校は？", "A.音駒高校", "B.青葉城西高校", "C.烏野高校", "D.白鳥沢学園"], ans: "C"},
    {q: "第34問", choices: ["アニメ『SPY×FAMILY』でアーニャが持つ能力は？", "A.予知能力", "B.読心術", "C.飛行能力", "D.瞬間移動"], ans: "B"},
    {q: "第35問", choices: ["アニメ『僕のヒーローアカデミア』緑谷出久のヒーロー名は？", "A.オールマイト", "B.デク", "C.かっちゃん", "D.ミドリ"], ans: "B"},
    {q: "第36問", choices: ["アニメ『シティハンター』で冴羽リョウが使われる言葉は？", "A.もっこり", "B.バズーカ", "C.ごっつぁん", "D.ラブラブ"], ans: "A"},
    {q: "第37問", choices: ["アニメ『カードキャプターさくら』でカードを封印する杖は？", "A.星の杖", "B.封印の杖", "C.マジカル杖", "D.さくらの杖"], ans: "B"},
    {q: "第38問", choices: ["アニメ『黒子のバスケ』の黒子テツヤの得意技は？", "A.シュート", "B.パス", "C.ダンク", "D.ドリブル"], ans: "B"},
    {q: "第39問", choices: ["アニメ『あしたのジョー』の矢吹丈のスポーツは？", "A.野球", "B.柔道", "C.ボクシング", "D.レスリング"], ans: "C"},
    {q: "第40問", choices: ["アニメ『千と千尋の神隠し』で湯婆婆が経営する場所は？", "A.銭湯", "B.ホテル", "C.油屋", "D.温泉旅館"], ans: "C"},
    {q: "第41問", choices: ["アニメ『家庭教師ヒットマンREBORN!』でリボーンの職業は？", "A.殺し屋", "B.ヒットマン", "C.教師", "D.ボディーガード"], ans: "B"},
    {q: "第42問", choices: ["アニメ『七つの大罪』の酒場の名前は？", "A.豚の帽子亭", "B.酒場の豚", "C.大罪の宿", "D.冒険者の酒場"], ans: "A"},
    {q: "第43問", choices: ["アニメ『ジョジョの奇妙な冒険』の特殊能力は？", "A.ハモン", "B.スタンド", "C.魔法", "D.気"], ans: "B"},
    {q: "第44問", choices: ["アニメ『ソードアート・オンライン』のデスゲームの名前は？", "A.ソードアート", "B.オンライン", "C.ソードアート・オンライン", "D.ゲーム・オブ・ソード"], ans: "C"},
    {q: "第45問", choices: ["アニメ『涼宮ハルヒの憂鬱』でハルヒが作った団体は？", "A.SOS団", "B.ハルヒ団", "C.不思議探検隊", "D.部活団"], ans: "A"},
    {q: "第46問", choices: ["アニメ『デスノート』のノートの名前は？", "A.死神ノート", "B.デスノート", "C.殺人ノート", "D.名前ノート"], ans: "B"},
    {q: "第47問", choices: ["アニメ『ヒカルの碁』でヒカルに取り憑くのは？", "A.藤原佐為", "B.平安の棋士", "C.天の声", "D.囲碁の神"], ans: "A"},
    {q: "第48問", choices: ["アニメ『マクロス』シリーズの要素は？", "A.歌とロボットと三角関係", "B.ダンスと剣と恋愛", "C.歌と魔法と友情", "D.ロボットとスポーツと絆"], ans: "A"},
    {q: "第49問", choices: ["アニメ『鋼の錬金術師』の最大のタブーは？", "A.金銀錬成", "B.人体錬成", "C.国家錬成", "D.賢者の石錬成"], ans: "B"},
    {q: "第50問", choices: ["アニメ『Dr.STONE』千空が使う学問は？", "A.物理学", "B.医学", "C.科学", "D.生物学"], ans: "C"},
];

for (let i = tf.all_questions.length - 1; i > 0; i--) {
    let j = Math.floor(Math.random() * (i + 1));
    let temp = tf.all_questions[i];
    tf.all_questions[i] = tf.all_questions[j];
    tf.all_questions[j] = temp;
}
tf.selected_questions = tf.all_questions.slice(0, 10);
[endscript]

[bg storage="haikei/easy_haikei.png" time="1000"]
[hidemenubutton]

; ▼ UIの配置 ▼
[layopt layer="1" visible="true"]
; 左上：LIFEのタイトルとハート
[ptext layer="1" page="fore" text="L I F E" size="24" x="50" y="20" color="0x333333" name="life_title"]
[ptext layer="1" page="fore" text="&tf.heart_text" size="30" x="50" y="55" color="0xFF6699" name="heart_ui"]

; 右上：ヒントの残り回数
[ptext layer="1" page="fore" text="&tf.hint_text" size="24" x="980" y="20" color="0x333333" name="hint_ui"]

; --- クイズ開始地点 ---
*question_loop
[iscript]
var q = tf.selected_questions[tf.current_index];
var choices = [q.choices[1], q.choices[2], q.choices[3], q.choices[4]];
for (let i = choices.length - 1; i > 0; i--) {
    let j = Math.floor(Math.random() * (i + 1));
    let temp = choices[i];
    choices[i] = choices[j];
    choices[j] = temp;
}
tf.shuffled = choices;
tf.correct_text = q.choices["ABCD".indexOf(q.ans) + 1];
tf.hint_used = false; 
[endscript]

; ▼ 問題文の表示 ▼
[cm]
[tb_show_message_window]
[emb exp="tf.selected_questions[tf.current_index].choices[0]"]
[p]

; ▼ ボタンの描画専用のラベル ▼
*show_choices
[cm]
[tb_hide_message_window]

; --- ボタン描画（2x2グリッド配置） ---
; 左上 (Aの位置)
[if exp="tf.shuffled[0] != ''"]
    [glink color="black" target="*check_answer" text="&tf.shuffled[0]" size="20" x="250" y="250" width="350" exp="tf.user_choice=tf.shuffled[0]"]
[endif]

; 右上 (Bの位置)
[if exp="tf.shuffled[1] != ''"]
    [glink color="black" target="*check_answer" text="&tf.shuffled[1]" size="20" x="680" y="250" width="350" exp="tf.user_choice=tf.shuffled[1]"]
[endif]

; 左下 (Cの位置)
[if exp="tf.shuffled[2] != ''"]
    [glink color="black" target="*check_answer" text="&tf.shuffled[2]" size="20" x="250" y="350" width="350" exp="tf.user_choice=tf.shuffled[2]"]
[endif]

; 右下 (Dの位置)
[if exp="tf.shuffled[3] != ''"]
    [glink color="black" target="*check_answer" text="&tf.shuffled[3]" size="20" x="680" y="350" width="350" exp="tf.user_choice=tf.shuffled[3]"]
[endif]

; 右上：ヒントボタン（テキストの下に配置）
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
tf.hint_count--; 
tf.hint_text = "残り回数：" + tf.hint_count + "回"; // テキストを更新
[endscript]

; 古いヒントテキストを消して書き直す
[free name="hint_ui" layer="1"]
[ptext layer="1" page="fore" text="&tf.hint_text" size="30" x="980" y="20" color="0x333333" name="hint_ui"]

[jump target="*show_choices"]


*check_answer
[cm]
[tb_show_message_window]
[if exp="tf.user_choice == tf.correct_text"]
    [eval exp="tf.score++"]
    正解！！[p]
    [jump target="*next_question"]
[else]
    [iscript]
    tf.life--;
    tf.heart_text = "♡".repeat(tf.life);
    [endscript]

    [free name="heart_ui" layer="1"]
    [ptext layer="1" page="fore" text="&tf.heart_text" size="40" x="50" y="60" color="0xFF6699" name="heart_ui"]

    残念、不正解…[p]
    正解は「[emb exp="tf.correct_text"]」でした。[p]

    [if exp="tf.life <= 0"]
        ライフが0になりました…。ゲームオーバー！[p]
        [jump target="*game_over"]
    [else]
        [jump target="*next_question"]
    [endif]
[endif]


*next_question
[eval exp="tf.current_index++"]
[if exp="tf.current_index >= 10"]
    [jump target="*quiz_end"]
[else]
    [jump target="*question_loop"]
[endif]


*game_over
[cm]
; UIを全て消去
[free name="heart_ui" layer="1"]
[free name="life_title" layer="1"]
[free name="hint_ui" layer="1"]
[tb_show_message_window]
ゲームオーバー…！[p]
ここまでよく頑張りました。[p]
[s]

*quiz_end
[cm]
; UIを全て消去
[free name="heart_ui" layer="1"]
[free name="life_title" layer="1"]
[free name="hint_ui" layer="1"]
お疲れ様でした！結果発表です！[p]
貴方は10点中 [emb exp="tf.score"] 点です！[p]
[s]
