[_tb_system_call storage=system/_ippannzatugaku_quiz.ks]


; --- 1. 難易度選択 ---

*difficulty_select

[iscript]
// ★ バックグラウンドタイマーの残存を破棄
if (tf.timer_id) {
    clearTimeout(tf.timer_id);
    tf.timer_id = null;
}
$(".time_gage").stop().css("transition", "none");
[endscript]

[hidemenubutton]

[plugin name="ReloadHide"]

[cm]
[tb_hide_message_window]
[freeimage layer="0"]
[freeimage layer="1"]
[freeimage layer="2"]

[bg storage="haikei/sky.png" time="800"]
[playbgm storage="bgm6.ogg" loop="true"]
[image layer="2" page="fore" storage="UI/level_haikei.png" x="350" y="35" width="550" height="150" reflect="false"]


; ★ 右上に「戻る」ボタンを配置（ジャンル選択画面へ戻る）
[button graphic="button/button17.png" enterimg="button/button17_1.png" x="1100" y="35" width="150" height="50" storage="genre_select.ks" target="*genre_select" hint="ジャンル選択画面へ戻ります"]


; 1. 現在選択中ジャンルの解放状況を判定
[iscript]
tf.current_genre = tf.current_genre || 'zatugaku';

var g = tf.current_genre;
tf.is_normal_unlocked   = (sf[g + '_normal'] == true);
tf.is_hard_unlocked     = (sf[g + '_hard'] == true);
tf.is_veryhard_unlocked = (sf[g + '_veryhard'] == true);
[endscript]


; 2. ボタン・画像の配置

; --- EASY ---
[button target="*setup_game" graphic="button/button34.png" enterimg="button/button34_1.png" x="50" y="250" width="250" height="450" exp="tf.diff='easy'" hint="初心者向け：サクサク進めたい方へ"]

; --- NORMAL ---
[if exp="tf.is_normal_unlocked == true"]
    [button target="*setup_game" graphic="button/button35.png" enterimg="button/button35_1.png" x="350" y="250" width="250" height="450" exp="tf.diff='normal'" hint="標準難易度：通常のバランスで楽しみたい方へ"]
[else]
    [image storage="../fgimage/button2/button035.png" x="350" y="250" width="250" height="450" layer="2"]
[endif]

; --- HARD ---
[if exp="tf.is_hard_unlocked == true"]
    [button target="*setup_game" graphic="button/button36.png" enterimg="button/button36_1.png" x="650" y="250" width="250" height="450" exp="tf.diff='hard'" hint="上級者向け：歯ごたえのある戦いを楽しみたい方へ"]
[else]
    [image storage="../fgimage/button2/button036.png" x="650" y="250" width="250" height="450" layer="2"]
[endif]

; --- VERY HARD ---
[if exp="tf.is_veryhard_unlocked == true"]
    [button target="*setup_game" graphic="button/button37.png" enterimg="button/button37_1.png" x="950" y="250" width="250" height="450" exp="tf.diff='veryhard'" hint="鬼畜難易度：極限の挑戦を求める方へ"]
[else]
    [image storage="../fgimage/button2/button037.png" x="950" y="250" width="250" height="450" layer="2"]
[endif]


; 3. 画面全体でホバーを監視
[iscript]
if ($('#custom_tooltip').length === 0) {
$('body').append('<div id="custom_tooltip" style="position:fixed; display:none; z-index:999999; pointer-events:none; padding:10px 14px; background:rgba(0,0,0,0.85); color:#ffffff; font-size:15px; font-weight:bold; border-radius:6px; border:2px solid #ffffff; box-shadow:0 4px 10px rgba(0,0,0,0.5); max-width:320px; line-height:1.4;"></div>');
}
$(document).off('.custom_tt');
$(document).on('mouseenter.custom_tt', '.button, .glink', function(e) {
var text = $(this).attr('hint');
if (text) {
$('#custom_tooltip').html(text).show();
}
});
$(document).on('mouseleave.custom_tt', '.button, .glink', function() {
$('#custom_tooltip').hide();
});
$(document).on('mousemove.custom_tt', '.button, .glink', function(e) {
$('#custom_tooltip').css({
top: (e.clientY + 15) + 'px',
left: (e.clientX + 15) + 'px'
});
});
[endscript]

[s]


*setup_game

; 決定時はツールチップを隠してイベントを解除

[iscript]
$('#custom_tooltip').hide();
$(document).off('.custom_tt');

// 未定義ガード
sf.selected_chara = sf.selected_chara || 'onp';
[endscript]

[cm]
[freeimage layer="base"]
[freeimage layer="0"]
[freeimage layer="1"]
[freeimage layer="2"]

[iscript]
// 出題数を10問に設定
tf.question_count = 10;
// クイズデータ
tf.all_questions = [
{q: "第1問", difficulty: "easy", choices: ["日本の首都はどこでしょう？", "A.大阪", "B.京都", "C.東京", "D.名古屋"], ans: "C", explain: "日本の首都は東京で、国会や行政機関などの中心機能が集まっている。"},
{q: "第2問", difficulty: "easy", choices: ["太陽系で最も大きい惑星はどれでしょう？", "A.火星", "B.地球", "C.土星", "D.木星"], ans: "D", explain: "木星は太陽系最大の惑星で、赤道半径は地球の約11倍、質量も他の惑星を大きく上回る。"},
{q: "第3問", difficulty: "easy", choices: ["水は何度で沸騰するでしょう（1気圧下）？", "A.80℃", "B.90℃", "C.100℃", "D.110℃"], ans: "C", explain: "水は標準大気圧下で100℃になると沸騰する。"},
{q: "第4問", difficulty: "easy", choices: ["おにぎりの具として、一般的によく知られているものは？", "A.石", "B.チョコ", "C.バナナ", "D.梅干し"], ans: "D", explain: "梅干しは日本の伝統的な保存食で、おにぎりの具として代表的な存在。"},
{q: "第5問", difficulty: "easy", choices: ["1年は何ヶ月あるでしょう？", "A.10ヶ月", "B.11ヶ月", "C.12ヶ月", "D.13ヶ月"], ans: "C", explain: "グレゴリオ暦では1年は12ヶ月で構成される。"},
{q: "第6問", difficulty: "easy", choices: ["ウサギの長い耳には、どのような役割がある？", "A.水中で呼吸すること", "B.体温調節を助けること", "C.飛ぶこと", "D.音をよく聞くこと"], ans: "D", explain: "ウサギの耳は音を集めて周囲の音を聞き取り、天敵などを察知するのに役立つ。また、血管が多く、体温調節にも利用される。"},
{q: "第7問", difficulty: "easy", choices: ["信号機の色で「止まれ」は？", "A.青", "B.黄", "C.赤", "D.緑"], ans: "C", explain: "赤信号は道路交通法において、歩行者や車両に停止位置を越えて進行してはならないことを示す色である。"},
{q: "第8問", difficulty: "easy", choices: ["太陽が昇る方角は？", "A.北", "B.南", "C.東", "D.西"], ans: "C", explain: "地球が西から東へ自転しているため、地上から見ると太陽は東から昇り西へ沈むように見える。"},
{q: "第9問", difficulty: "easy", choices: ["「猫」を英語で言うと？", "A.Dog", "B.Cat", "C.Bird", "D.Fish"], ans: "B", explain: "猫を表す基本的な英単語は「Cat」であり、子猫は「Kitten」と呼ばれる。"},
{q: "第10問", difficulty: "easy", choices: ["一般的なアイスクリームで、主な原材料として使われるものは？", "A.油", "B.醤油", "C.味噌", "D.牛乳・乳製品"], ans: "D", explain: "一般的なアイスクリームには、牛乳や生クリームなどの乳製品が主な原材料として使われる。乳固形分や乳脂肪分の割合によって、食品表示上の種類も定められている。"},
{q: "第11問", difficulty: "easy", choices: ["「一石二鳥」の意味は？", "A.石を投げること", "B.鳥を二羽飼うこと", "C.一つの行為で二つの利益を得ること", "D.二羽の鳥がケンカすること"], ans: "C", explain: "一石二鳥は、一つの行動で同時に二つの良い結果や利益を得ることを表す言葉である。"},
{q: "第12問", difficulty: "easy", choices: ["童謡『桃太郎』で、桃太郎が犬や猿、キジに与えてお供にしたものは？", "A.きびだんご", "B.おにぎり", "C.まんじゅう", "D.おせんべい"], ans: "A", explain: "桃太郎は「日本一のきびだんご」を持ち歩き、出会った犬・猿・キジに分け与えてお供にした。"},
{q: "第13問", difficulty: "easy", choices: ["「月」を英語で言うと何？", "A.Moon", "B.Sun", "C.Star", "D.Sky"], ans: "A", explain: "地球の衛星である月を表す英単語は「Moon」で、「Sun」は太陽、「Star」は星を意味する。"},
{q: "第14問", difficulty: "easy", choices: ["昆虫のカブトムシの脚の数は全部で何本？", "A.4本", "B.6本", "C.8本", "D.10本"], ans: "B", explain: "カブトムシは昆虫なので、成虫の脚は左右3本ずつの合計6本である。"},
{q: "第15問", difficulty: "easy", choices: ["スポーツの「野球」は、基本的に1チーム何人でプレイする？", "A.9人", "B.11人", "C.7人", "D.5人"], ans: "A", explain: "野球では、基本的に1チーム9人で守備につき、攻撃と守備を交代しながら得点を競う。"},
{q: "第16問", difficulty: "easy", choices: ["日本の硬貨で、一番金額が大きいのはどれ？", "A.100円玉", "B.500円玉", "C.50円玉", "D.10円玉"], ans: "B", explain: "現在流通している通常硬貨の中で最も額面が大きいのは500円玉である。"},
{q: "第17問", difficulty: "easy", choices: ["日本の四季で、春の次に来る季節は？", "A.夏", "B.秋", "C.冬", "D.梅雨"], ans: "A", explain: "日本の四季は春・夏・秋・冬の順に巡り、春の次に訪れる季節は夏である。"},
{q: "第18問", difficulty: "easy", choices: ["「牛乳」を英語で言うと何？", "A.ウォーター", "B.ジュース", "C.ミルク", "D.ティー"], ans: "C", explain: "牛乳を表す基本的な英単語は「Milk」で、「Water」は水、「Tea」はお茶を意味する。"},
{q: "第19問", difficulty: "easy", choices: ["「モナ・リザ」を描いた人物は？", "A.ゴッホ", "B.ピカソ", "C.レオナルド・ダ・ヴィンチ", "D.ミケランジェロ"], ans: "C", explain: "『モナ・リザ』はレオナルド・ダ・ヴィンチの代表作で、スフマート技法が特徴。"},
{q: "第20問", difficulty: "easy", choices: ["ピアノの鍵盤の数は、一般的なフルサイズでいくつ？", "A.76", "B.88", "C.96", "D.100"], ans: "B", explain: "一般的なフルサイズのピアノは白鍵52鍵と黒鍵36鍵の合計88鍵で構成されている。"},
{q: "第21問", difficulty: "normal", choices: ["世界で一番面積が広い国はどこでしょう？", "A.中国", "B.アメリカ", "C.カナダ", "D.ロシア"], ans: "D", explain: "ロシアは世界最大の面積を持つ国で、ヨーロッパとアジアにまたがって広がっている。11の標準時を持つことでも知られる。"},
{q: "第22問", difficulty: "normal", choices: ["フランスの首都は？", "A.ベルリン", "B.ロンドン", "C.パリ", "D.ローマ"], ans: "C", explain: "パリはフランスの首都で、セーヌ川沿いに位置し、多くの歴史的・文化的施設が集まっている。"},
{q: "第23問", difficulty: "normal", choices: ["健康な成人の睡眠時間の目安として一般的に推奨される<br>範囲に近いのは？", "A.2時間", "B.20時間", "C.15時間", "D.7～9時間"], ans: "D", explain: "健康な成人では、一般的に7～9時間程度の睡眠が目安とされる。ただし、必要な睡眠時間には個人差がある。"},
{q: "第24問", difficulty: "normal", choices: ["日本で一番高い山は？", "A.北岳", "B.間ノ岳", "C.奥穂高岳", "D.富士山"], ans: "D", explain: "富士山は標高3776mの日本最高峰で、2013年に世界文化遺産に登録された。"},
{q: "第25問", difficulty: "normal", choices: ["「三権分立」に含まれないものは？", "A.立法", "B.行政", "C.司法", "D.軍事"], ans: "D", explain: "三権分立は、国家の権力を立法・行政・司法の三つに分け、互いに抑制・均衡させる仕組み。"},
{q: "第26問", difficulty: "normal", choices: ["日本の現在の元号は？", "A.平成", "B.昭和", "C.令和", "D.大正"], ans: "C", explain: "現在の日本の元号は「令和」。2019年5月1日に改元され、「令和」は『万葉集』に収められた梅花の歌の序文を典拠としている。"},
{q: "第27問", difficulty: "normal", choices: ["日本で最も面積が大きい都道府県は？", "A.岩手県", "B.北海道", "C.福島県", "D.長野県"], ans: "B", explain: "北海道は日本の都道府県の中で最も面積が広く、日本の国土の約2割を占める。"},
{q: "第28問", difficulty: "normal", choices: ["「ありがとう」を英語で言うと？", "A.Hello", "B.Good bye", "C.Thank you", "D.Sorry"], ans: "C", explain: "英語で感謝を伝える基本的な表現は「Thank you」で、くだけた場面では「Thanks」なども使われる。"},
{q: "第29問", difficulty: "normal", choices: ["日本三大名園の一つに含まれないのは？", "A.兼六園", "B.後楽園", "C.偕楽園", "D.足立美術館"], ans: "D", explain: "日本三名園は、兼六園（石川県金沢市）、後楽園（岡山県岡山市）、偕楽園（茨城県水戸市）の三つを指す。"},
{q: "第30問", difficulty: "normal", choices: ["現在発行されている日本の1000円札の肖像は誰？", "A.福沢諭吉", "B.野口英世", "C.北里柴三郎", "D.樋口一葉"], ans: "C", explain: "2024年7月から発行された新しい千円紙幣の肖像は、破傷風血清療法などで知られる医学者・北里柴三郎である。"},
{q: "第31問", difficulty: "normal", choices: ["日本の代表的な花として、皇室の紋章にも用いられている花は？", "A.菊", "B.梅", "C.百合", "D.薔薇"], ans: "A", explain: "菊は日本を代表する花の一つで、皇室の紋章には十六弁八重表菊紋が用いられている。"},
{q: "第32問", difficulty: "normal", choices: ["東京タワーの高さは？", "A.333m", "B.634m", "C.450m", "D.200m"], ans: "A", explain: "東京タワーの高さは333mで、1958年に完成した東京の代表的なランドマークである。"},
{q: "第33問", difficulty: "normal", choices: ["「すし」という言葉の語源として有力とされているのは？", "A.「酸し（すし）」という古い形容詞", "B.「酢を使う」という意味", "C.魚をすすること", "D.寿司屋があること"], ans: "A", explain: "「すし」の語源は、酸っぱいことを意味する古語の形容詞「酸し（すし）」に由来するとする説が有力である。"},
{q: "第34問", difficulty: "normal", choices: ["アメリカ合衆国の初代大統領は誰？", "A.エイブラハム・リンカーン", "B.ジョージ・ワシントン", "C.ジョン・F・ケネディ", "D.トーマス・ジェファーソン"], ans: "B", explain: "ジョージ・ワシントンは、アメリカ合衆国憲法のもとで選出された初代大統領で、1789年に就任した。"},
{q: "第35問", difficulty: "normal", choices: ["夏目漱石の小説『吾輩は猫である』に登場する主人公の猫の名前は？", "A.タマ", "B.トラ", "C.クロ", "D.名前はまだない"], ans: "D", explain: "『吾輩は猫である』の語り手である猫には固有の名前がなく、冒頭でも「名前はまだ無い」と語られている。"},
{q: "第36問", difficulty: "normal", choices: ["円周率はおよそ「3.14…」と続きますが、14の次に続く2桁の数字は？", "A.15", "B.25", "C.59", "D.92"], ans: "A", explain: "円周率πは3.14159265…と続くため、3.14の次に続く2桁の数字は「15」である。"},
{q: "第37問", difficulty: "normal", choices: ["太陽系で、地球のすぐ外側を公転している惑星は？", "A.金星", "B.火星", "C.木星", "D.水星"], ans: "B", explain: "太陽からの距離で並べると、水星・金星・地球・火星・木星…となるため、地球のすぐ外側を公転している惑星は火星である。"},
{q: "第38問", difficulty: "normal", choices: ["世界で最も標高が高い山はどれ？", "A.エベレスト", "B.K2", "C.キリマンジャロ", "D.マッキンリー"], ans: "A", explain: "エベレストは海抜8848.86mとされる世界最高峰で、ヒマラヤ山脈に位置する。"},
{q: "第39問", difficulty: "normal", choices: ["日本のことわざで「犬も歩けば」に続く言葉は？", "A.棒に当たる", "B.骨を見つける", "C.転んでしまう", "D.人に吠える"], ans: "A", explain: "「犬も歩けば棒に当たる」は、出歩いたり行動したりすれば、思わぬ災難や幸運に出会うことがあるという意味のことわざ。"},
{q: "第40問", difficulty: "normal", choices: ["日本の紙幣で、現在発行されている最も額面が大きいものは？", "A.一万円札", "B.五千円札", "C.二千円札", "D.千円札"], ans: "A", explain: "日本で現在発行されている紙幣の中で最も額面が大きいのは一万円札で、現在の新紙幣の肖像は渋沢栄一。"},
{q: "第41問", difficulty: "hard", choices: ["「銀」の元素記号は？", "A.Au", "B.Cu", "C.Fe", "D.Ag"], ans: "D", explain: "銀の元素記号「Ag」は、ラテン語の「Argentum」に由来している。"},
{q: "第42問", difficulty: "hard", choices: ["「ハムレット」の作者は誰？", "A.ゲーテ", "B.ヘミングウェイ", "C.ドストエフスキー", "D.シェイクスピア"], ans: "D", explain: "『ハムレット』はウィリアム・シェイクスピアの代表的な悲劇作品で、「生きるべきか、死ぬべきか」の台詞で知られる。"},
{q: "第43問", difficulty: "hard", choices: ["世界遺産を最も多く保有する国はどこでしょう<br>（2025年時点）？", "A.ギリシャ", "B.日本", "C.エジプト", "D.イタリア"], ans: "D", explain: "イタリアは2025年時点で、ユネスコの世界遺産登録件数が世界最多の国である。"},
{q: "第44問", difficulty: "hard", choices: ["元素記号「O」は何を表す？", "A.金", "B.鉄", "C.水素", "D.酸素"], ans: "D", explain: "酸素の元素記号「O」は、英語名「Oxygen」に由来する。"},
{q: "第45問", difficulty: "hard", choices: ["夏目漱石の代表作ではないのは？", "A.こころ", "B.坊っちゃん", "C.吾輩は猫である", "D.人間失格"], ans: "D", explain: "『人間失格』は太宰治の代表作で、他の選択肢は夏目漱石の代表作である。"},
{q: "第46問", difficulty: "hard", choices: ["オリンピックのシンボルマークに描かれている輪の数は<br>いくつ？", "A.3", "B.4", "C.5", "D.6"], ans: "C", explain: "オリンピックシンボルは、青・黄・黒・緑・赤の5つの輪で構成されている。"},
{q: "第47問", difficulty: "hard", choices: ["赤いリンゴの果皮の色に関係する代表的な色素は？", "A.ビタミンC", "B.クロロフィル", "C.カロテン", "D.アントシアニン"], ans: "D", explain: "赤いリンゴの果皮の色には、アントシアニン系の色素が関係している。品種や成熟度などによって色合いは異なる。"},
{q: "第48問", difficulty: "hard", choices: ["ジャイアントパンダの主食として知られているものは？", "A.お肉", "B.昆虫", "C.魚", "D.竹"], ans: "D", explain: "ジャイアントパンダは分類上は食肉目に属するが、食物の大部分をタケやササ類が占めている。"},
{q: "第49問", difficulty: "hard", choices: ["日本で一番長い川は？", "A.利根川", "B.信濃川", "C.石狩川", "D.北上川"], ans: "B", explain: "信濃川は全長約367kmの日本最長の河川で、上流では千曲川と呼ばれている。流域面積では利根川が日本最大である。"},
{q: "第50問", difficulty: "hard", choices: ["「千」という漢字の書き順では、最後は何画目？", "A.1画目", "B.2画目", "C.3画目", "D.4画目"], ans: "C", explain: "「千」は3画で、1画目が短い左払い、2画目が横棒、3画目が中央を通る縦画となる。"},
{q: "第51問", difficulty: "hard", choices: ["日本の信号機で「青信号」と呼ばれている色は、<br>実際にはどの色に近い？", "A.真っ青", "B.緑", "C.紫", "D.黒"], ans: "B", explain: "日本の「青信号」は、実際には緑色の信号灯である。ただし、日本では古くから緑色を含めて「青」と呼ぶ習慣があり、「青信号」という名称が定着している。"},
{q: "第52問", difficulty: "hard", choices: ["地下にあるマグマが地表に噴出したものを何という？", "A.溶岩", "B.火山灰", "C.軽石", "D.火砕流"], ans: "A", explain: "マグマが地表に噴出すると「溶岩」と呼ばれる。溶岩は、地表に出たマグマそのものや、それが冷えて固まったものを指す。"},
{q: "第53問", difficulty: "hard", choices: ["ベートーヴェンの有名な交響曲は？", "A.「運命」", "B.「春」", "C.「くるみ割り人形」", "D.「アイネ・クライネ・ナハトムジーク」"], ans: "A", explain: "ベートーヴェン作曲の交響曲第5番ハ短調は、日本では「運命」の通称で広く知られている。"},
{q: "第54問", difficulty: "hard", choices: ["ノーベル賞の創設者であるアルフレッド・ノーベルが発明したものは何？", "A.ダイナマイト", "B.電話", "C.電球", "D.飛行機"], ans: "A", explain: "アルフレッド・ノーベルはダイナマイトを発明した人物として知られる。彼の遺言に基づき、その遺産がノーベル賞の創設に使われた。"},
{q: "第55問", difficulty: "hard", choices: ["人間の成人の体にある骨の数は、一般的に全部でいくつとされている？", "A.108個", "B.206個", "C.365個", "D.512個"], ans: "B", explain: "成人の骨の数は、一般的に206個とされている。ただし、個人差によって数が異なる場合もある。"},
{q: "第56問", difficulty: "hard", choices: ["元素記号「Au」が表す元素は何？", "A.銀", "B.銅", "C.金", "D.鉄"], ans: "C", explain: "金の元素記号「Au」は、ラテン語の「Aurum」に由来している。"},
{q: "第57問", difficulty: "hard", choices: ["世界で初めて世界一周を成し遂げた航海隊を率いた人物は誰？", "A.コロンブス", "B.マゼラン", "C.クック", "D.バスコ・ダ・ガマ"], ans: "B", explain: "マゼランが率いた艦隊は1519年に航海を開始した。マゼラン本人は航海途中で死亡したが、残った乗組員が1522年に帰還し、史上初の世界一周航海を達成した。"},
{q: "第58問", difficulty: "hard", choices: ["宝石の重さを表す単位「1カラット」は、何グラムに相当する？", "A.0.1グラム", "B.0.2グラム", "C.0.5グラム", "D.1.0グラム"], ans: "B", explain: "宝石の質量を表す1カラットは、0.2グラム（200ミリグラム）と定められている。"},
{q: "第59問", difficulty: "hard", choices: ["日本で最初にノーベル賞を受賞した人物は誰？", "A.湯川秀樹", "B.朝永振一郎", "C.川端康成", "D.福井謙一"], ans: "A", explain: "湯川秀樹は中間子理論の研究で1949年にノーベル物理学賞を受賞し、日本人初のノーベル賞受賞者となった。"},
{q: "第60問", difficulty: "hard", choices: ["キリンの首の骨（頸椎）の数はいくつか？", "A.7個", "B.14個", "C.21個", "D.28個"], ans: "A", explain: "キリンの頸椎は7個で、人間を含む多くの哺乳類と同じ数である。キリンでは一つ一つの頸椎が非常に長く発達している。"},
{q: "第61問", difficulty: "veryhard", choices: ["世界で最も長い川として一般的に知られているのは？", "A.アマゾン川", "B.ミシシッピ川", "C.長江", "D.ナイル川"], ans: "D", explain: "ナイル川は全長約6650kmで、一般に世界最長の川として知られている。ただし、川の起点や測定方法によってはアマゾン川を最長とする説もある。"},
{q: "第62問", difficulty: "veryhard", choices: ["江戸幕府の最後の将軍は？", "A.徳川家康", "B.徳川家光", "C.徳川慶喜", "D.徳川綱吉"], ans: "C", explain: "徳川慶喜は江戸幕府第15代将軍で、1867年に大政奉還を行った。"},
{q: "第63問", difficulty: "veryhard", choices: ["ギザの三大ピラミッドがある国は？", "A.メキシコ", "B.中国", "C.ブラジル", "D.エジプト"], ans: "D", explain: "ギザの三大ピラミッドはエジプトのカイロ近郊にあり、クフ王・カフラー王・メンカウラー王のために建てられた。"},
{q: "第64問", difficulty: "veryhard", choices: ["地球の自転の向きは？", "A.東から西", "B.北から南", "C.南から北", "D.西から東"], ans: "D", explain: "地球は北極側から見ると反時計回りに、自転軸を中心に西から東へ回転している。この自転によって太陽が東から昇り西へ沈むように見える。"},
{q: "第65問", difficulty: "veryhard", choices: ["大西洋と太平洋をつなぐ運河は？", "A.スエズ運河", "B.パナマ運河", "C.キール運河", "D.コリント運河"], ans: "B", explain: "パナマ運河はパナマ地峡を横断して造られた閘門式運河で、大西洋側のカリブ海と太平洋を短距離で結んでいる。"},
{q: "第66問", difficulty: "veryhard", choices: ["地球の表面積で、海洋が占める割合は約何％？", "A.50％", "B.70％", "C.80％", "D.90％"], ans: "B", explain: "地球の表面積の約71％は海洋に覆われており、このため宇宙から見ると青く見える惑星として知られている。"},
{q: "第67問", difficulty: "veryhard", choices: ["太陽系で最も太陽に近い惑星は？", "A.金星", "B.地球", "C.水星", "D.火星"], ans: "C", explain: "水星は太陽系の第1惑星で、太陽に最も近い軌道を公転しており、大気がほとんどないため昼夜の温度差が極端に大きい。"},
{q: "第68問", difficulty: "veryhard", choices: ["世界で最も面積が小さい国は？", "A.モナコ", "B.バチカン市国", "C.ナウル", "D.サンマリノ"], ans: "B", explain: "バチカン市国はローマ市内にある独立国家で、面積約0.44平方kmの世界最小の主権国家であり、ローマ教皇庁が置かれている。"},
{q: "第69問", difficulty: "veryhard", choices: ["「ノーベル賞」の賞の種類に含まれないのは？", "A.物理学賞", "B.数学賞", "C.平和賞", "D.文学賞"], ans: "B", explain: "ノーベル賞には数学部門はなく、数学分野ではフィールズ賞やアーベル賞が権威ある賞として知られている。"},
{q: "第70問", difficulty: "veryhard", choices: ["人間活動による地球温暖化に大きく関係する温室効果ガスは？", "A.酸素", "B.窒素", "C.二酸化炭素", "D.ヘリウム"], ans: "C", explain: "化石燃料の使用などによって排出が増えている二酸化炭素は、地球温暖化に大きく関係する代表的な温室効果ガスである。"},
{q: "第71問", difficulty: "veryhard", choices: ["世界で最も人口が多い国は？", "A.中国", "B.アメリカ", "C.インド", "D.インドネシア"], ans: "C", explain: "インドは人口が増加し、現在は世界で最も人口の多い国となっている。"},
{q: "第72問", difficulty: "veryhard", choices: ["古代エジプトの文字「ヒエログリフ」を解読する手がかりとなった石碑の名前は？", "A.ロゼッタ・ストーン", "B.ハンムラビ法典", "C.モアブの石碑", "D.ベヒストゥン碑文"], ans: "A", explain: "ロゼッタ・ストーンは同じ内容が3種の文字で刻まれた碑文で、ヒエログリフ解読の鍵となった。"},
{q: "第73問", difficulty: "veryhard", choices: ["現在の日本の国会議事堂の中央塔の高さは約何メートル？", "A.約45メートル", "B.約65メートル", "C.約85メートル", "D.約105メートル"], ans: "B", explain: "国会議事堂の中央塔の高さは約65.45メートルである。"},
{q: "第74問", difficulty: "veryhard", choices: ["パラリンピックのシンボルマークとして使われている、赤・青・緑の3色の曲線からなるマークの名前は？", "A.スリー・アギトス", "B.トリコロール・フレイム", "C.パラ・リングス", "D.スリー・スピリッツ"], ans: "A", explain: "スリー・アギトスはパラリンピックのシンボルマークで、赤・青・緑の3本の曲線からなる。名称の「アギトス」はラテン語に由来し、「私は動く」という意味が込められている。"},
{q: "第75問", difficulty: "veryhard", choices: ["ピカソとともに「キュビスム」を創始したことで知られるフランスの画家は誰？", "A.アンリ・マティス", "B.ジョルジュ・ブラック", "C.クロード・モネ", "D.サルバドール・ダリ"], ans: "B", explain: "ジョルジュ・ブラックはピカソとともに、対象を幾何学的に再構成するキュビスムを創始した画家。"},
{q: "第76問", difficulty: "veryhard", choices: ["国際連合における公用語は、英語、フランス語、ロシア語、中国語、スペイン語と、あと一つは何語？", "A.ドイツ語", "B.アラビア語", "C.日本語", "D.ポルトガル語"], ans: "B", explain: "国連の公用語は英語・フランス語・ロシア語・中国語・スペイン語・アラビア語の6言語である。"},
{q: "第77問", difficulty: "veryhard", choices: ["一般に「世界三大珍味」と呼ばれるものは、トリュフ、フォアグラと何？", "A.キャビア", "B.ツバメの巣", "C.フカヒレ", "D.カラスミ"], ans: "A", explain: "一般に「世界三大珍味」と呼ばれるものは、トリュフ、フォアグラ、そしてチョウザメの卵の塩漬けであるキャビア。"},
{q: "第78問", difficulty: "veryhard", choices: ["アメリカの宇宙船アポロ11号が月面に着陸したのは西暦何年？", "A.1961年", "B.1965年", "C.1969年", "D.1973年"], ans: "C", explain: "アポロ11号は1969年7月20日に月面へ着陸し、人類初の月面歩行が行われた。"},
{q: "第79問", difficulty: "veryhard", choices: ["ヨーロッパの国「ルクセンブルク」の首都はどこ？", "A.ブリュッセル", "B.ルクセンブルク市", "C.ファドゥーツ", "D.ベルン"], ans: "B", explain: "ルクセンブルクの首都は国名と同じルクセンブルク市で、旧市街と要塞群が世界遺産に登録されている。"},
{q: "第80問", difficulty: "veryhard", choices: ["古代ギリシャの哲学者で、「イデア論」を提唱したソクラテスの弟子は誰？", "A.プラトン", "B.アリストテレス", "C.ピタゴラス", "D.アルキメデス"], ans: "A", explain: "プラトンはソクラテスの弟子で、永遠不変の真の姿が存在するとするイデア論を展開した哲学者。"}
];
if(tf.diff == null) tf.diff = "easy";

; 難易度フィルタリング
tf.filtered = tf.all_questions.filter(function(q) {
    var level = q.difficulty || "easy";
    if(tf.diff == "easy") return level == "easy";
    if(tf.diff == "normal") return (level == "easy" || level == "normal");
    if(tf.diff == "hard") return (level == "easy" || level == "normal" || level == "hard");
    return true;
});

; 配列シャッフル
for (var i = tf.filtered.length - 1; i > 0; i--) {
    var j = Math.floor(Math.random() * (i + 1));
    var temp = tf.filtered[i];
    tf.filtered[i] = tf.filtered[j];
    tf.filtered[j] = temp;
}

// 10問を抽出
tf.selected_questions = tf.filtered.slice(0, tf.question_count);

tf.current_index = 0;
tf.score = 0;

; 設定値初期化
if(tf.diff == "easy"){
    tf.max_life = 5;
    tf.life = 5;
    tf.time_limit = 30;
    tf.hint_count = 4;
    tf.current_bg = 'haikei/easy_haikei.png';
    tf.current_bgm = 'zatugaku_easy.ogg';
} else if(tf.diff == "normal"){
    tf.max_life = 4;
    tf.life = 4;
    tf.time_limit = 25;
    tf.hint_count = 3;
    tf.current_bg = 'haikei/normal_haikei.png';
    tf.current_bgm = 'zatugaku_normal.ogg';
} else if(tf.diff == "hard"){
    tf.max_life = 3;
    tf.life = 3;
    tf.time_limit = 20;
    tf.hint_count = 2;
    tf.current_bg = 'haikei/hard_haikei.png';
    tf.current_bgm = 'zatugaku_hard.ogg';
} else if(tf.diff == "veryhard"){
    tf.max_life = 2;
    tf.life = 2;
    tf.time_limit = 15;
    tf.hint_count = 1;
    tf.current_bg = 'haikei/very_hard_haikei.png';
    tf.current_bgm = 'zatugaku_very_hard.ogg';
}

tf.life = tf.max_life;
[endscript]

[call storage="loading_scene.ks" target="*loading_start"]
[image layer="base" storage="&tf.current_bg" time="800"]

; ★ チュートリアル・開始前のBGMとして鳴らす
[playbgm storage="bgm1.ogg" loop="true"]

; --- 全体共通の変数初期化 ---
[iscript]
if(tf.diff == "easy") { tf.diff_name = "イージー"; }
else if(tf.diff == "normal") { tf.diff_name = "ノーマル"; }
else if(tf.diff == "hard") { tf.diff_name = "ハード"; }
else if(tf.diff == "veryhard") { tf.diff_name = "ベリーハード"; }

// キャラ画像のパス（全シーン共通）
f.chara_img = sf.selected_chara + "/" + sf.selected_chara + "_normal.png";

// 数値（Number型）として設定
if (sf.selected_chara == "onp") {
    f.chara_x = 350;
    f.chara_y = 160;
    f.chara_w = 700;
} else if (sf.selected_chara == "quiz") {
    f.chara_x = 460;
    f.chara_y = 180;
    f.chara_w = 400;
} else if (sf.selected_chara == "tukuyomi") {
    f.chara_x = 420;
    f.chara_y = 160;
    f.chara_w = 450;
} else if (sf.selected_chara == "ameno") {
    f.chara_x = 310;
    f.chara_y = 130;
    f.chara_w = 550;
} else if (sf.selected_chara == "zunda") {
    f.chara_x = 440;
    f.chara_y = 150;
    f.chara_w = 500;
}

// ウェルカム演出用ボイス
f.wel_v1     = "voice/" + sf.selected_chara + "/welcome_voice1.ogg";
f.wel_v_diff = "voice/" + sf.selected_chara + "/diff_" + tf.diff + ".ogg";
f.wel_v2     = "voice/" + sf.selected_chara + "/welcome_voice2.ogg";
f.wel_v3     = "voice/" + sf.selected_chara + "/welcome_voice3.ogg";
f.wel_v4     = "voice/" + sf.selected_chara + "/welcome_voice4.ogg";
f.wel_v5     = "voice/" + sf.selected_chara + "/welcome_voice5.ogg";
[endscript]


; EASY 以外の難易度はチュートリアル判定をスキップして強制的にウェルカム演出へ
[jump target="*welcome_scene" storage=""]
[s]

; --- 4. ウェルカム演出 ---

*welcome_scene

[cm]

[layopt layer="1" visible="true"]

; --- キャラごとに直接サイズと位置を指定して画像配置（画面中央） ---
[if exp="sf.selected_chara == 'onp'"]
    [image storage="onp/onp_normal.png" layer="1" x="350" y="120" width="550" name="chara_stand"]
[elsif exp="sf.selected_chara == 'quiz'"]
    [image storage="quiz/quiz_normal.png" layer="1" x="480" y="140" width="400" name="chara_stand"]
[elsif exp="sf.selected_chara == 'tukuyomi'"]
    [image storage="tukuyomi/tukuyomi_normal.png" layer="1" x="420" y="160" width="450" name="chara_stand"]
[elsif exp="sf.selected_chara == 'ameno'"]
    [image storage="ameno/ameno_normal.png" layer="1" x="310" y="130" width="550" name="chara_stand"]
[elsif exp="sf.selected_chara == 'zunda'"]
    [image storage="zunda/zunda_normal.png" layer="1" x="400" y="150" width="500" name="chara_stand"]
[endif]

[tb_show_message_window]

; --------------------------------
; 1番：音符ちゃん
; --------------------------------
[if exp="sf.selected_chara == 'onp'"]

    [stopse]
    [playse storage="&f.wel_v1"]
    新クイズで遊ぼう！の世界へようこそ！[p]

    [stopse]
    [playse storage="&f.wel_v2"]
    [emb exp="tf.diff_name"]の問題は20問がランダムで最大10問が出題されます。！[r]
    ※難易度が高くなるほど、今まで出題されていた問題も出ます。[p]

    [stopse]
    [playse storage="&f.wel_v3"]
    4つの選択肢から1つを選んで正解を見つけてね！[p]

    [stopse]
    [playse storage="&f.wel_v4"]
    では、クイズを始めるよ！[p]

[endif]

; --------------------------------
; 2番：くいずちゃん
; --------------------------------
[if exp="sf.selected_chara == 'quiz'"]

    [stopse]
    [playse storage="&f.wel_v1"]
    べ、別にあなたを歓迎してるわけじゃないんだからね！[p]
    
    [stopse]
    [playse storage="&f.wel_v2"]
    ……ふん、『新クイズで遊ぼう！』の世界へようこそ、ってことにしておいてあげるわ。[p]
    
    [stopse]
    [playse storage="&f.wel_v3"]
    [emb exp="tf.diff_name"]の問題は20問ある中から、ランダムで最大10問出題されるわ。[r]
    ※難易度が高くなるほど、今まで出題されていた問題も出ます。[p]
    
    [stopse]
    [playse storage="&f.wel_v4"]
    4つの選択肢から正解を1つ選べばいいだけ。[p]

    [stopse]
    [playse storage="&f.wel_v5"]
    さあ、準備はいい？クイズを始めるわよ！足を引っ張らないでよね！[p]

[endif]

; --------------------------------
; 3番：つくよみちゃん
; --------------------------------
[if exp="sf.selected_chara == 'tukuyomi'"]

    [stopse]
    [playse storage="&f.wel_v1"]
    新クイズで遊ぼう!の世界へようこそお願いいたします！[p]

    [stopse]
    [playse storage="&f.wel_v2"]
    [emb exp="tf.diff_name"]問題は20問ご用意されておりまして、[p]

    [stopse]
    [playse storage="&f.wel_v3"]
    その中からランダムで最大10問が出題されますわ。[r]
    ※難易度が高くなるほど、今まで出題されていた問題も出ます。[p]
    
    [stopse]
    [playse storage="&f.wel_v4"]
    4つの選択肢の中から正解を1つ選んでみてくださいね[p]

    [stopse]
    [playse storage="&f.wel_v5"]
    それでは、クイズを始めましょう！[p]

[endif]

; --------------------------------
; 4番：あめのちゃん
; --------------------------------
[if exp="sf.selected_chara == 'ameno'"]

    [stopse]
    [playse storage="&f.wel_v1"]
    新クイズで遊ぼう！の世界へようこそたい！[p]

    [stopse]
    [playse storage="&f.wel_v2"]
    [emb exp="tf.diff_name"]の問題は20問ある中から、ランダムで最大10問が出題されるばい。[r]
    ※難易度が高くなるほど、今まで出題されていた問題も出ます。[p]

    [stopse]
    [playse storage="&f.wel_v3"]
    4つの選択肢から1つ選んで正解ば見つけてはいよ！[p]

    [stopse]
    [playse storage="&f.wel_v4"]
    それじゃあ、クイズば始めるばい！[p]

[endif]

; --------------------------------
; 5番：ずんだもん
; --------------------------------
[if exp="sf.selected_chara == 'zunda'"]

    [stopse]
    [playse storage="&f.wel_v1"]
    新クイズで遊ぼう！の世界へようこそなのだ！[p]

    [stopse]
    [playse storage="&f.wel_v2"]
    [emb exp="tf.diff_name"]の問題は全20問がランダムで10問選択されて出題されるのだ！[r]
    ※難易度が高くなるほど、今まで出題されていた問題も出ます。[p]

    [stopse]
    [playse storage="&f.wel_v3"]
    4つの選択肢から1つを選んで正解を見つけるのだ！[p]

    [stopse]
    [playse storage="&f.wel_v4"]
    それじゃあ、クイズを始めるのだ！[p]

[endif]

; --------------------------------
; 共通の演出終了処理
; --------------------------------
[stopse]
[tb_hide_message_window]

; ★ 右移動時のリサイズ現象を防ぐため、anim にも横幅を指定
[if exp="sf.selected_chara == 'onp'"]
    [anim name="chara_stand" left="900" width="550" time="1000"]
[elsif exp="sf.selected_chara == 'quiz'"]
    [anim name="chara_stand" left="900" width="400" time="1000"]
[elsif exp="sf.selected_chara == 'tukuyomi'"]
    [anim name="chara_stand" left="900" width="450" time="1000"]
[elsif exp="sf.selected_chara == 'ameno'"]
    [anim name="chara_stand" left="850" width="550" time="1000"]
[elsif exp="sf.selected_chara == 'zunda'"]
    [anim name="chara_stand" left="900" width="500" time="1000"]
[endif]
[wa]
[freeimage layer="1"]

[eval exp="sf.tutorial_seen = true"]

[jump target="*question_loop" storage=""]

; --- 5. ライフ表示処理（サブルーチン） ---

*show_life

; layer="2" の life_heart をすべて消去
[free layer="2" name="life_heart"]

; ★2. LIFEテキストロゴ
[image layer="2" name="life_heart" storage="UI/life.png" x="60" y="10" width="250" height="100"]

[iscript]
tf.h1 = (tf.life >= 1) ? "UI/heart1.png" : "UI/heart01.png";
tf.h2 = (tf.life >= 2) ? "UI/heart1.png" : "UI/heart01.png";
tf.h3 = (tf.life >= 3) ? "UI/heart1.png" : "UI/heart01.png";
tf.h4 = (tf.life >= 4) ? "UI/heart1.png" : "UI/heart01.png";
tf.h5 = (tf.life >= 5) ? "UI/heart1.png" : "UI/heart01.png";
[endscript]

; ★3. ハート表示
[image layer="2" name="life_heart" storage="&tf.h1" x="40" y="100" width="50" height="50" cond="tf.max_life >= 1"]
[image layer="2" name="life_heart" storage="&tf.h2" x="100" y="100" width="50" height="50" cond="tf.max_life >= 2"]
[image layer="2" name="life_heart" storage="&tf.h3" x="160" y="100" width="50" height="50" cond="tf.max_life >= 3"]
[image layer="2" name="life_heart" storage="&tf.h4" x="220" y="100" width="50" height="50" cond="tf.max_life >= 4"]
[image layer="2" name="life_heart" storage="&tf.h5" x="280" y="100" width="50" height="50" cond="tf.max_life >= 5"]

[return]

; --- 6. クイズループ ---
*question_loop

[iscript]
if(tf.current_index >= tf.question_count){
    tf.loop_next = "*quiz_end";
} else {
    tf.loop_next = "*continue_quiz";
}
[endscript]

[jump target="&tf.loop_next" storage=""]

*continue_quiz

; --- 前の表示・テキスト・旧立ち絵を完全に消去 ---
[cm]
[free layer="2" name="question_text"]
[free layer="2" name="q_count_text"]

; 出題前に演出用の古い立ち絵を画面から完全に消去
[free layer="1" name="chara_stand"]
[freeimage layer="1"]

; キャラ立ち絵（通常顔）描画の準備
[iscript]
var c = sf.selected_chara;
if (c !== 'onp' && c !== 'quiz' && c !== 'tukuyomi' && c !== 'ameno' && c !== 'zunda') {
    c = 'onp';
}
tf.chara_normal = c + "/" + c + "_normal.png";

if (c == 'onp') {
    tf.q_x = "900"; tf.q_y = "120"; tf.q_w = "550";
} else if (c == 'quiz') {
    tf.q_x = "900"; tf.q_y = "140"; tf.q_w = "400";
} else if (c == 'tukuyomi') {
    tf.q_x = "900"; tf.q_y = "160"; tf.q_w = "450";
} else if (c == 'ameno') {
    tf.q_x = "850"; tf.q_y = "130"; tf.q_w = "550";
} else if (c == 'zunda') {
    tf.q_x = "900"; tf.q_y = "150"; tf.q_w = "500";
}
[endscript]

[layopt layer="1" visible="true"]
[image storage="&tf.chara_normal" layer="1" x="&tf.q_x" y="&tf.q_y" width="&tf.q_w" name="chara_stand"]

; 第1問目の開始時だけ、bgm1 を止めて難易度BGMに切り替える
[if exp="tf.current_index == 0"]
    [stopbgm]
    [playbgm storage="&tf.current_bgm" loop="true"]
[endif]

[iscript]
// クイズデータ初期化 ＆ 選択肢シャッフル
var q = tf.selected_questions[tf.current_index];
tf.q_title = "第" + (tf.current_index + 1) + "問";
tf.q_count_str = "第" + (tf.current_index + 1) + "問";
tf.q_text = q.choices[0];

function removePrefix(text) {
    return text.replace(/^[A-D]\.\s*/, '');
}
var ans_idx = "ABCD".indexOf(q.ans) + 1;
tf.correct_text = removePrefix(q.choices[ans_idx]);
var choices = [
    removePrefix(q.choices[1]),
    removePrefix(q.choices[2]),
    removePrefix(q.choices[3]),
    removePrefix(q.choices[4])
];
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
tf.hint_used = false;

// 制限時間のミリ秒計算
tf.wait_time = tf.time_limit * 1000;
[endscript]

; --- 2. UI背景とライフの描画 ---
[call target="*show_life" storage=""]
[layopt layer="2" visible="true"]

[image layer="2" storage="UI/bar_hk.png" x="410" y="70" name="time_bar_hk" width="470" height="70"]
[image layer="2" storage="UI/gage.png" x="425" y="70" name="time_gage" width="450" height="70"]
[image layer="2" storage="UI/time_cover.png" x="320" y="15" name="time_cover" width="600" height="150"]

[ptext layer="2" name="q_count_text" text="&tf.q_count_str" x="1030" y="25" size="36" color="0xFFFFFF" align="center"]

[iscript]
$(".q_count_text").css({
    "background-color": "rgba(0, 0, 0, 0.55)",
    "padding": "6px 20px",
    "border-radius": "12px",
    "letter-spacing": "2px"
});
[endscript]

; --- 3. 「第〇問」演出 ---
[playse storage="se/mondai.ogg"]

[tb_show_message_window]
[emb exp="tf.q_title"]
[p]

[tb_hide_message_window]

; --- 4. 出題＆選択肢表示 ---
[ptext layer="2" name="question_text" text="&tf.q_text" x="350" y="180" size="22" color="0x000000" width="600" align="center"]

[iscript]
$(".question_text").css({
    "background-color": "rgba(255, 255, 255, 0.85)",
    "padding": "15px 20px",
    "border-radius": "15px",
    "box-shadow": "0px 4px 10px rgba(0,0,0,0.1)"
});
[endscript]

[glink color="black" target="*check_answer" text="&tf.shuffled[0]" size="20" x="250" y="300" width="250" exp="tf.choice_num=0" cond="tf.show0"]
[glink color="black" target="*check_answer" text="&tf.shuffled[1]" size="20" x="680" y="300" width="250" exp="tf.choice_num=1" cond="tf.show1"]
[glink color="black" target="*check_answer" text="&tf.shuffled[2]" size="20" x="250" y="420" width="250" exp="tf.choice_num=2" cond="tf.show2"]
[glink color="black" target="*check_answer" text="&tf.shuffled[3]" size="20" x="680" y="420" width="250" exp="tf.choice_num=3" cond="tf.show3"]
[free layer="2" name="hint_btn"]
[button storage="" target="*use_hint" graphic="button/button1.png" enterimg="button/button01.png" x="1000" y="600" name="hint_btn"]

*show_choices

[iscript]
$(".hint_btn").css({
    "filter": "none",
    "opacity": "1.0",
    "pointer-events": "auto"
});
if(tf.hint_used == true || tf.hint_count <= 0){
    $(".hint_btn").css({
        "filter": "grayscale(100%)",
        "opacity": "0.5",
        "pointer-events": "none"
    });
}

// ゲージの見た目を初期化
$(".time_gage").stop().css({
    "transition": "none",
    "width": "450px",
    "clip-path": "inset(0 0% 0 0)",
    "opacity": "1",
    "display": "block"
});

// CSS transition でアニメーション開始
setTimeout(function(){
    $(".time_gage").css({
        "transition": "clip-path " + tf.time_limit + "s linear",
        "clip-path": "inset(0 100% 0 0)"
    });
}, 20);

// タイマーカウントダウン設定
if (tf.timer_id) {
    clearTimeout(tf.timer_id);
    tf.timer_id = null;
}

tf.timer_id = setTimeout(function(){
    TYRANO.kag.ftag.startTag("jump", { target: "*time_up" });
}, tf.wait_time);
[endscript]

; タイマーSE再生
[stopse]
[playse storage="se/timer2.ogg" loop="true" cond="tf.time_limit <= 15"]
[playse storage="se/timer1.ogg" loop="true" cond="tf.time_limit > 15"]

; カウントダウン中は入力待ち
[s]


; --- 7. 回答判定処理 ---

*check_answer

; タイマー音を停止
[stopse]

[iscript]
// 回答ボタン押下時にタイマーを完全クリア
if (tf.timer_id) {
    clearTimeout(tf.timer_id);
    tf.timer_id = null;
}

$(".time_gage").css("transition", "none");

// 選択された回答のテキストを取得して正誤判定
var selected_text = tf.shuffled[tf.choice_num];
tf.is_correct = (selected_text === tf.correct_text);

var c = sf.selected_chara;
if (c !== 'onp' && c !== 'quiz' && c !== 'tukuyomi' && c !== 'ameno' && c !== 'zunda') {
    c = 'onp';
}

if (tf.is_correct) {
    tf.chara_result = c + "/" + c + "_happy.png";
} else {
    tf.chara_result = c + "/" + c + "_sad.png";
}

if (c == 'onp') {
    tf.q_x = "900"; tf.q_y = "120"; tf.q_w = "550";
} else if (c == 'quiz') {
    tf.q_x = "900"; tf.q_y = "140"; tf.q_w = "400";
} else if (c == 'tukuyomi') {
    tf.q_x = "900"; tf.q_y = "160"; tf.q_w = "450";
} else if (c == 'ameno') {
    tf.q_x = "850"; tf.q_y = "130"; tf.q_w = "550";
} else if (c == 'zunda') {
    tf.q_x = "900"; tf.q_y = "150"; tf.q_w = "500";
}
[endscript]

; タイマーUI等を削除
[free layer="2" name="time_gage"]
[free layer="2" name="time_cover"]
[free layer="2" name="time_bar_hk"]

[free layer="1" name="chara_stand"]
[layopt layer="1" visible="true"]
[image storage="&tf.chara_result" layer="1" x="&tf.q_x" y="&tf.q_y" width="&tf.q_w" name="chara_stand"]

; --- 正解の場合 ---
[if exp="tf.is_correct == true"]

    [playse storage="se/seikai.ogg" clear="true"]
    [eval exp="tf.score++"]

    [tb_show_message_window]
    正解！[p]
    解説：[emb exp='tf.selected_questions[tf.current_index].explain'][p]

; --- 不正解の場合 ---
[else]

    [playse storage="se/hazure.ogg" clear="true"]
    [eval exp="tf.life = tf.life - 1"]
    [iscript]
    if(tf.life < 0){ tf.life = 0; }
    [endscript]

    [call target="*show_life" storage=""]

    [tb_show_message_window]
    不正解……！[p]
    正解は「[emb exp="tf.correct_text"]」でした。[r]
    解説：[emb exp='tf.selected_questions[tf.current_index].explain'][p]

[endif]

; メッセージ表示後の後処理
[free layer="2" name="question_text"]
[free layer="2" name="hint_btn"]

; ライフ切れ判定
[jump cond="tf.life <= 0" target="*quiz_end" storage=""]

; まだライフが残っている場合は立ち絵を消して次の問題へ
[free layer="1" name="chara_stand"]
[eval exp="tf.current_index++"]
[jump target="*question_loop" storage=""]


; ========================================
; ★ ヒントボタン押下時の処理
; ========================================
*use_hint

[iscript]
tf.hint_used = true;
tf.hint_count--;

var q = tf.selected_questions[tf.current_index];
var correct = tf.correct_text;
var wrong_indices = [];

for (var i = 0; i < 4; i++) {
    if (tf.shuffled[i] !== correct && tf["show" + i] === true) {
        wrong_indices.push(i);
    }
}

for (var k = wrong_indices.length - 1; k > 0; k--) {
    var m = Math.floor(Math.random() * (k + 1));
    var tmp = wrong_indices[k];
    wrong_indices[k] = wrong_indices[m];
    wrong_indices[m] = tmp;
}

if (wrong_indices.length >= 2) {
    tf["show" + wrong_indices[0]] = false;
    tf["show" + wrong_indices[1]] = false;
}
[endscript]

[playse storage="se/hint.ogg" clear="true"]

[jump target="*redraw_choices_only" storage=""]


; ========================================
; ★ 選択肢再描画用ラベル
; ========================================
*redraw_choices

[cm]

[glink color="black" target="*check_answer" text="&tf.shuffled[0]" size="20" x="250" y="300" width="250" exp="tf.choice_num=0" cond="tf.show0"]
[glink color="black" target="*check_answer" text="&tf.shuffled[1]" size="20" x="680" y="300" width="250" exp="tf.choice_num=1" cond="tf.show1"]
[glink color="black" target="*check_answer" text="&tf.shuffled[2]" size="20" x="250" y="420" width="250" exp="tf.choice_num=2" cond="tf.show2"]
[glink color="black" target="*check_answer" text="&tf.shuffled[3]" size="20" x="680" y="420" width="250" exp="tf.show3"]

[free layer="2" name="hint_btn"]
[button storage="" target="*use_hint" graphic="button/button1.png" enterimg="button/button01.png" x="1000" y="600" name="hint_btn"]

[jump target="*show_choices" storage=""]

; ========================================
; ★ 選択肢再描画用ラベル（ヒント使用時専用）
; ========================================
*redraw_choices_only

[cm]

; 選択肢ボタンを消去反映した状態で再描画
[glink color="black" target="*check_answer" text="&tf.shuffled[0]" size="20" x="250" y="300" width="250" exp="tf.choice_num=0" cond="tf.show0"]
[glink color="black" target="*check_answer" text="&tf.shuffled[1]" size="20" x="680" y="300" width="250" exp="tf.choice_num=1" cond="tf.show1"]
[glink color="black" target="*check_answer" text="&tf.shuffled[2]" size="20" x="250" y="420" width="250" exp="tf.choice_num=2" cond="tf.show2"]
[glink color="black" target="*check_answer" text="&tf.shuffled[3]" size="20" x="680" y="420" width="250" exp="tf.show3"]

; ヒントボタンを配置し、使用済み状態（グレーアウト）に設定
[free layer="2" name="hint_btn"]
[button storage="" target="*use_hint" graphic="button/button1.png" enterimg="button/button01.png" x="1000" y="600" name="hint_btn"]

[iscript]
$(".hint_btn").css({
    "filter": "grayscale(100%)",
    "opacity": "0.5",
    "pointer-events": "none"
});
[endscript]

; ★ 消えてしまったタイマーSEを鳴らし直す
[stopse]
[playse storage="se/timer2.ogg" loop="true" cond="tf.time_limit <= 15"]
[playse storage="se/timer1.ogg" loop="true" cond="tf.time_limit > 15"]

; ★ タイマーやゲージのアニメーションはいじらず、そのまま入力待ちにする
[s]


; --- 時間切れ処理 ---

*time_up

[cm]
[stopse]
[playse storage="se/time_up.ogg"]

[iscript]
// 時間切れ時もタイマーを完全クリア
if (tf.timer_id) {
    clearTimeout(tf.timer_id);
    tf.timer_id = null;
}

$(".time_gage").css("transition", "none");
[endscript]

; タイマーUIを消去
[free layer="2" name="time_gage"]
[free layer="2" name="time_cover"]
[free layer="2" name="time_bar_hk"]

; 残念顔の表示準備 & 座標設定
[iscript]
var c = sf.selected_chara;
if (c !== 'onp' && c !== 'quiz' && c !== 'tukuyomi' && c !== 'ameno' && c !== 'zunda') {
    c = 'onp';
}
tf.chara_sad = c + "/" + c + "_sad.png";

if (c == 'onp') {
    tf.q_x = "900"; tf.q_y = "120"; tf.q_w = "550";
} else if (c == 'quiz') {
    tf.q_x = "900"; tf.q_y = "140"; tf.q_w = "400";
} else if (c == 'tukuyomi') {
    tf.q_x = "900"; tf.q_y = "160"; tf.q_w = "450";
} else if (c == 'ameno') {
    tf.q_x = "850"; tf.q_y = "130"; tf.q_w = "550";
} else if (c == 'zunda') {
    tf.q_x = "900"; tf.q_y = "150"; tf.q_w = "500";
}
[endscript]

; キャラの立ち絵を残念顔に変更
[free layer="1" name="chara_stand"]
[layopt layer="1" visible="true"]
[image storage="&tf.chara_sad" layer="1" x="&tf.q_x" y="&tf.q_y" width="&tf.q_w" name="chara_stand"]

; ライフ減少処理
[eval exp="tf.life = tf.life - 1"]
[iscript]
if(tf.life < 0){ tf.life = 0; }
[endscript]

; ハート表示を更新
[call target="*show_life" storage=""]

; メッセージウィンドウ表示＆クリック待ち
[tb_show_message_window]

時間切れ！[p]
正解は「[emb exp="tf.correct_text"]」でした。[p]

解説：[emb exp='tf.selected_questions[tf.current_index].explain'][p]

; テキストメッセージとヒントボタンを削除
[free layer="2" name="question_text"]
[free layer="2" name="hint_btn"]

; ライフ判定（0になったらゲームオーバー/リザルトへ）
[jump cond="tf.life <= 0" target="*quiz_end" storage=""]

; まだライフが残っている場合は立ち絵を消して次の問題へ
[free layer="1" name="chara_stand"]
[eval exp="tf.current_index++"]
[jump target="*question_loop" storage=""]


; --- ゲーム終了処理 ---

*quiz_end

[cm]

[iscript]
// リザルト移行時もバックグラウンドタイマーを確実に破棄
if (tf.timer_id) {
    clearTimeout(tf.timer_id);
    tf.timer_id = null;
}
$(".time_gage").stop().css("transition", "none");
[endscript]

[tb_show_message_window]

貴方は[emb exp="tf.question_count"]点中[emb exp="tf.score"]点です！[p]

[iscript]
tf.current_genre = 'zatugaku';

var key_normal   = tf.current_genre + '_normal';
var key_hard     = tf.current_genre + '_hard';
var key_veryhard = tf.current_genre + '_veryhard';

tf.show_dialog = false;
tf.alert_msg   = "";

if (tf.diff === 'easy' && !sf[key_normal]) {
    // 表記揺れ（zatsugaku / zatugaku）の両方にフラグを立てて保持
    sf.zatugaku_easy = true;
    sf.zatsugaku_easy = true;
    sf.trivia_easy   = true;
    sf[key_normal]   = true;
    sf.trivia_normal = true;
    sf.unlock_genre  = true;
    tf.show_dialog   = true;
    tf.alert_msg     = "全ジャンル ＆ 雑学の難易度 NORMAL が解放されました！";

    // ★ 全ジャンルEASY達成チェック（ここで最後の場合の解放通知を追加）
    if (sf.animation_easy && sf.game_easy && sf.netslang_easy) {
        sf.unlock_zunda = true;
        tf.alert_msg   += "\n★ 全ジャンルEASYクリア！キャラクター「ずんだもん」が解放されました！";
    }
}

if (tf.diff === 'normal' && tf.score >= 8 && !sf[key_hard]) {
    sf[key_hard]    = true;
    sf.trivia_hard  = true;
    tf.show_dialog  = true;
    tf.alert_msg    = "8問以上正解！雑学の難易度 HARD が解放されました！";
}

if (tf.diff === 'hard' && tf.score >= 8 && tf.life == tf.max_life && !sf[key_veryhard]) {
    sf[key_veryhard]   = true;
    sf.trivia_veryhard = true;
    tf.show_dialog     = true;
    tf.alert_msg       = "ノーダメージクリア！雑学の最高難易度 VERY HARD が解放されました！";
}
[endscript]

[dialog type="alert" text="&tf.alert_msg" cond="tf.show_dialog == true"]

[tb_hide_message_window]
[freeimage layer="2"]
[freeimage layer="1"]

[jump storage="title_screen.ks" target="*game_end"]
