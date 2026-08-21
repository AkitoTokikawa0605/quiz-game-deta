[_tb_system_call storage=system/_quiz_animation.ks]


; --- 1. 難易度選択 ---


*difficulty_select

[hidemenubutton]

[plugin name="ReloadHide"]

[cm  ]
[tb_hide_message_window  ]
[freeimage layer="0"]

[freeimage layer="1"]

[freeimage layer="2"]

[bg  storage="haikei/sky.png"  time="800"  ]
[image layer="2" page="fore" storage="UI/level_haikei.png" x="350" y="35" width="550" height="150" reflect="false"]


; 1. ボタンに hint 属性で説明文を記述


[button  target="*setup_game"  graphic="button/button34.png"  enterimg="button/button34_1.png"  x="50"  y="250"  width="250"  height="450"  exp="tf.diff='easy'"  hint="初心者向け：サクサク進めたい方へ"  storage=""  ]
[button  target="*setup_game"  graphic="button/button35.png"  enterimg="button/button35_1.png"  x="350"  y="250"  width="250"  height="450"  exp="tf.diff='normal'"  hint="標準難易度：通常のバランスで楽しみたい方へ"  storage=""  ]
[button  target="*setup_game"  graphic="button/button36.png"  enterimg="button/button36_1.png"  x="650"  y="250"  width="250"  height="450"  exp="tf.diff='hard'"  hint="上級者向け：歯ごたえのある戦いを楽しみたい方へ"  storage=""  ]
[button  target="*setup_game"  graphic="button/button37.png"  enterimg="button/button37_1.png"  x="950"  y="250"  width="250"  height="450"  exp="tf.diff='veryhard'"  hint="鬼畜難易度：極限の挑戦を求める方へ"  storage=""  ]

; 2. 画面全体でホバーを監視


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

[s  ]
*setup_game


; 決定時はツールチップを隠してイベントを解除


[iscript]
$('#custom_tooltip').hide();
$(document).off('.custom_tt');
[endscript]

[cm  ]
[freeimage layer="base"]

[freeimage layer="0"]

[freeimage layer="1"]

[freeimage layer="2"]

[iscript]
// 出題数を10問に設定
tf.question_count = 10;
// ▼ アニメクイズデータ（全80問）のみに限定 ▼
tf.all_questions = [
{q: "第1問", difficulty: "normal", choices: ["『呪術廻戦』で、虎杖悠仁が受肉することになった<br>特級呪物は？", "A.両面宿儺の指", "B.獄門疆", "C.特級過呪怨霊", "D.天逆鉾"], ans: "A", explain: "両面宿儺の指は特級呪物で、虎杖が飲み込んだことで受肉した。"},
{q: "第2問", difficulty: "easy", choices: ["アニメ『ドラえもん』で、ドラえもんが一番大好物な<br>食べ物は何でしょう？", "A.みたらし団子", "B.どら焼き", "C.カレーライス", "D.鉄"], ans: "B", explain: "どら焼きはドラえもんの大好物として知られる和菓子。作中でも頻繁に食べており、どら焼きのために行動することも多い象徴的な食べ物。"},
{q: "第3問", difficulty: "veryhard", choices: ["『ふしぎの海のナディア』の着想の元となった作家は？", "A.H.G.ウェルズ", "B.エドガー・アラン・ポー", "C.ジュール・ヴェルヌ", "D.アーサー・コナン・ドイル"], ans: "C", explain: "ジュール・ヴェルヌはフランスのSF小説家。『海底二万里』などの作品が『ふしぎの海のナディア』の原案や世界観のモチーフとなった。"},
{q: "第4問", difficulty: "hard", choices: ["『攻殻機動隊』の主人公、草薙素子の階級は？", "A.大佐", "B.中佐", "C.軍曹", "D.少佐"], ans: "D", explain: "草薙素子は公安9課のリーダー格で、「少佐」と呼ばれている。軍属時代の階級に由来する呼称として、作中でも定着している。"},
{q: "第5問", difficulty: "normal", choices: ["『鋼の錬金術師』で、エドワード・エルリックが<br>失った体の部位は？", "A.右腕と左脚", "B.左腕と右脚", "C.両腕", "D.両脚"], ans: "A", explain: "エドワードは禁忌とされる錬金術の代償として右腕と左脚を失い、機械鎧（オートメイル）を装着して戦うことになった。"},
{q: "第6問", difficulty: "easy", choices: ["『ポケットモンスター』の主人公、<br>サトシの最初の相棒といえば？", "A.ヒトカゲ", "B.ピカチュウ", "C.フシギダネ", "D.ゼニガメ"], ans: "B", explain: "ピカチュウはサトシがオーキド博士から譲り受けた最初のポケモン。最初は懐かなかったが、冒険を通じてかけがえのない相棒となった。"},
{q: "第7問", difficulty: "veryhard", choices: ["『魔法少女まどか☆マギカ』の脚本を書いた人物は？", "A.奈須きのこ", "B.虚空の王", "C.虚淵玄", "D.虚数空間"], ans: "C", explain: "虚淵玄はニトロプラス所属のシナリオライター。綿密でダークな世界観の構築に定評があり、『魔法少女まどか☆マギカ』の全話脚本を担当した。"},
{q: "第8問", difficulty: "hard", choices: ["『うる星やつら』のラムちゃんが乗っている<br>宇宙船のデザインは？", "A.UFO型", "B.円盤型", "C.飛行機型", "D.虎柄のUFO"], ans: "D", explain: "鬼族の宇宙人であるラムが使用する宇宙船は、彼女のトレードマークでもある黄色と黒の虎柄模様が施された独自のUFOデザインをしている。"},
{q: "第9問", difficulty: "normal", choices: ["『君の名は。』の監督は誰？", "A.新海誠", "B.宮崎駿", "C.細田守", "D.庵野秀明"], ans: "A", explain: "新海誠は緻密な風景描写と繊細な人間ドラマで知られる映画監督。2016年に公開された『君の名は。』は大ヒットを記録し代表作となった。"},
{q: "第10問", difficulty: "easy", choices: ["『アンパンマン』の作者は誰？", "A.藤子・F・不二雄", "B.やなせたかし", "C.手塚治虫", "D.鳥山明"], ans: "B", explain: "やなせたかしは『それいけ！アンパンマン』を生み出した漫画家・絵本作家。自分の顔をちぎって分け与える独自のヒーロー像を確立した。"},
{q: "第11問", difficulty: "veryhard", choices: ["『輪るピングドラム』の監督は誰？", "A.細田守", "B.湯浅政明", "C.幾原邦彦", "D.今敏"], ans: "C", explain: "幾原邦彦は独自の演出スタイルと象徴的な映像美で知られるアニメーション監督。『少女革命ウテナ』に続き本作でも監督を務めた。"},
{q: "第12問", difficulty: "hard", choices: ["『機動戦士ガンダム』で、シャア・アズナブルが<br>「赤い彗星」と呼ばれるようになった理由は？", "A.赤い服を着ていたから", "B.彗星を操る能力があったから", "C.赤い髪をしていたから", "D.赤い機体と、その驚異的な速度から"], ans: "D", explain: "シャアは赤く塗装された専用機で驚異的な機動を見せたことから「赤い彗星」と呼ばれるようになった。"},
{q: "第13問", difficulty: "normal", choices: ["『コードギアス 反逆のルルーシュ』で、主人公ルルーシュが持つ能力は？", "A.ギアス", "B.写輪眼", "C.念能力", "D.個性"], ans: "A", explain: "ルルーシュがC.C.から授かった能力は「ギアス」。相手の目を見ることで、絶対遵守の命令を下すことができる。"},
{q: "第14問", difficulty: "easy", choices: ["『名探偵コナン』の主人公、江戸川コナンが本来の姿に戻るために追っている組織は？", "A.赤の組織", "B.黒の組織", "C.白の組織", "D.青の組織"], ans: "B", explain: "黒の組織は工藤新一に試作段階の毒薬APTX4869を飲ませ、身体を幼児化させた謎の犯罪組織。全身黒づくめの衣装が特徴。"},
{q: "第15問", difficulty: "veryhard", choices: ["『パプリカ』の原作小説を書いた作家は？", "A.星新一", "B.小松左京", "C.筒井康隆", "D.半村良"], ans: "C", explain: "筒井康隆は日本を代表するSF作家。『パプリカ』は夢に入り込んで治療を行うSF小説で、今敏監督によってアニメ映画化された。"},
{q: "第16問", difficulty: "hard", choices: ["『未来少年コナン』で、コナンが住んでいた島は？", "A.インダストリア", "B.ハイハーバー", "C.ラナの島", "D.のこされ島"], ans: "D", explain: "「のこされ島」は大変動後に生き残った人々が暮らしていた小島で、主人公コナンがおじいと一緒に平和に生活していた物語の出発点。"},
{q: "第17問", difficulty: "normal", choices: ["『銀魂』で、万事屋のメンバーでないのは？", "A.土方十四郎", "B.志村新八", "C.神楽", "D.坂田銀時"], ans: "A", explain: "土方十四郎は江戸の治安を守る特殊警察「真選組」の副長。坂田銀時・志村新八・神楽の3人が何でも屋である「万事屋銀ちゃん」のメンバー。"},
{q: "第18問", difficulty: "easy", choices: ["『となりのトトロ』で、サツキとメイが出会う不思議な<br>存在として正しいものは？", "A.ネコバス", "B.小トトロ", "C.まっくろくろすけ", "D.トトロ"], ans: "D", explain: "トトロは豊かな自然が残る森の主として人知れず暮らしている不思議な生き物。サツキとメイの姉妹と出会い交流を深めていく。"},
{q: "第19問", difficulty: "veryhard", choices: ["『灰羽連盟』の作者は？", "A.村田蓮爾", "B.いとうのいぢ", "C.安倍吉俊", "D.貞本義行"], ans: "C", explain: "安倍吉俊はイラストレーター・漫画家。『灰羽連盟』は彼が制作した同人誌『オールドホームの灰羽達』を原作としてアニメ化された作品。"},
{q: "第20問", difficulty: "hard", choices: ["『BANANA FISH』の舞台である、アッシュ・リンクスが<br>活動拠点とする街は？", "A.ロサンゼルス", "B.ニューヨーク", "C.シカゴ", "D.マイアミ"], ans: "B", explain: "アッシュ・リンクスはニューヨークのストリートギャングをまとめる少年ボスであり、物語の大半がニューヨークを中心に展開する。"},
{q: "第21問", difficulty: "normal", choices: ["『デスノート』で、キラとして活動した主人公の名前は？", "A.夜神月", "B.L", "C.ニア", "D.メロ"], ans: "A", explain: "夜神月（やがみらいと）はデスノートを拾い、名前を書くことで犯罪者を粛清し、自らを新世界の神「キラ」と称して活動した主人公。"},
{q: "第22問", difficulty: "easy", choices: ["『鬼滅の刃』の主人公、竈門炭治郎が背負っている箱に<br>入っているのは？", "A.刀", "B.妹の禰豆子", "C.食料", "D.本"], ans: "B", explain: "炭治郎の妹である禰豆子は鬼になってしまったため、太陽の光を避ける目的で鱗滝左近次が作った木製の箱に入って移動している。"},
{q: "第23問", difficulty: "veryhard", choices: ["『ブレンパワード』の監督は誰？", "A.宮崎駿", "B.高畑勲", "C.富野由悠季", "D.押井守"], ans: "C", explain: "富野由悠季は『機動戦士ガンダム』などで知られるアニメーション監督。『ブレンパワード』は1998年に放送されたロボットアニメ。"},
{q: "第24問", difficulty: "hard", choices: ["『寄生獣』の主人公、泉新一の右手に寄生した<br>ミギーの主な栄養源は？", "A.人間", "B.新一の血液", "C.動物の肉", "D.植物"], ans: "B", explain: "ミギーは脳への侵入に失敗して新一の右手に寄生したパラサイト。宿主である新一の血液から流れてくる栄養分を得て生存している。"},
{q: "第25問", difficulty: "normal", choices: ["『ハイキュー!!』の主人公、日向翔陽が所属する高校の<br>バレーボール部の特徴は？", "A.落ちた強豪と呼ばれる", "B.強豪校だが弱小", "C.無名の高校", "D.エリートが集まる高校"], ans: "A", explain: "日向が所属する烏野高校バレー部はかつて全国大会に出場する強豪だったが、衰退したことで「落ちた強豪、飛べない烏」と呼ばれていた。"},
{q: "第26問", difficulty: "easy", choices: ["『ONE PIECE』で、ルフィが目指しているものは？", "A.世界一の剣豪", "B.海賊王", "C.世界皇帝", "D.大海賊"], ans: "B", explain: "モンキー・D・ルフィは「ひとつなぎの大秘宝（ワンピース）」を見つけて、世界で一番自由な存在である「海賊王」になることを目指している。"},
{q: "第27問", difficulty: "veryhard", choices: ["『地球へ…』の原作者は？", "A.萩尾望都", "B.大島弓子", "C.竹宮惠子", "D.山岸凉子"], ans: "C", explain: "竹宮惠子は日本の漫画家。『地球へ…』は1970年代に連載されたSF金字塔作品であり、劇場アニメやTVアニメとして映像化された。"},
{q: "第28問", difficulty: "hard", choices: ["『天元突破グレンラガン』で、<br>カミナが愛用している武器は？", "A.拳銃", "B.ハンマー", "C.槍", "D.大刀"], ans: "D", explain: "大グレン団の初代リーダーであるカミナは、身の丈を超えるほど非常に長い大刀（日本刀）を愛用し、戦闘や指揮を執る際に振るった。"},
{q: "第29問", difficulty: "normal", choices: ["『クレヨンしんちゃん』の野原しんのすけの父、<br>ひろしの会社での役職は？", "A.係長", "B.課長", "C.部長", "D.係長代理"], ans: "A", explain: "野原ひろしは双葉商事営業第1課に勤務しているサラリーマンで、作中では「係長」の役職を務めている。"},
{q: "第30問", difficulty: "easy", choices: ["『サザエさん』の磯野家で、一番年上なのは？", "A.フネ", "B.波平", "C.サザエ", "D.カツオ"], ans: "B", explain: "磯野波平は磯野家の大黒柱で、54歳。妻のフネは50ン歳とされている。"},
{q: "第31問", difficulty: "veryhard", choices: ["『星界の紋章』に登場する架空の言語「アーヴ語」を<br>創作した人物は？", "A.河野六郎", "B.金田一春彦", "C.森岡浩之", "D.萩尾望都"], ans: "C", explain: "森岡浩之は小説『星界の紋章』の著者。作品のリアリティを高めるため、作中種族が使う「アーヴ語（文字・文法）」を自ら構築した。"},
{q: "第32問", difficulty: "hard", choices: ["『あしたのジョー』で、矢吹丈の最大のライバルである<br>力石徹の階級は？", "A.フェザー級", "B.ライト級", "C.ウェルター級", "D.バンタム級"], ans: "D", explain: "力石徹は元々ウェルター級相当の体格だったが、丈と同じリングに立つため過酷な減量を行い、バンタム級まで階級を落として戦った。"},
{q: "第33問", difficulty: "normal", choices: ["『るろうに剣心』の主人公、緋村剣心の頬にある傷の形は？", "A.×（十字）", "B.丸", "C.一本線", "D.三日月"], ans: "A", explain: "剣心の左頬にある十字傷は、彼の過去を象徴する特徴的な傷であり、物語の中でも重要な意味を持つ。"},
{q: "第34問", difficulty: "easy", choices: ["『新世紀エヴァンゲリオン』で、<br>主人公・碇シンジが乗る機体は？", "A.エヴァンゲリオン零号機", "B.エヴァンゲリオン初号機", "C.エヴァンゲリオン弐号機", "D.エヴァンゲリオンMark.06"], ans: "B", explain: "碇シンジはネルフの最高司令官である父・ゲンドウに呼び出され、人型決戦兵器エヴァンゲリオン初号機のパイロットに選ばれた。"},
{q: "第35問", difficulty: "veryhard", choices: ["『王立宇宙軍 オネアミスの翼』の制作会社は？", "A.サンライズ", "B.東映アニメーション", "C.ガイナックス", "D.スタジオジブリ"], ans: "C", explain: "ガイナックスは『王立宇宙軍 オネアミスの翼』を制作するために立ち上げられたアニメ制作会社。圧倒的な作画密度で高い評価を得た。"},
{q: "第36問", difficulty: "hard", choices: ["『MONSTER』で、ヨハン・リーベルトと<br>双子の妹アンナが生まれた国は？", "A.東ドイツ", "B.西ドイツ", "C.オーストリア", "D.チェコスロバキア"], ans: "D", explain: "物語の鍵を握る双子（ヨハンとアンナ）は、かつてのチェコスロバキア（プラハ）で出生した設定になっている。"},
{q: "第37問", difficulty: "normal", choices: ["『ジョジョの奇妙な冒険』の第1部の主人公は？", "A.ジョナサン・<br>ジョースター", "B.空条承太郎", "C.ジョセフ・<br>ジョースター", "D.東方仗助"], ans: "A", explain: "ジョナサン・ジョースターは第1部『ファントムブラッド』の主人公。宿敵ディオ・ブランドーとの因縁から始まる壮絶な物語を描いた。"},
{q: "第38問", difficulty: "easy", choices: ["『美少女戦士セーラームーン』で、主人公月野うさぎが<br>変身する決め台詞は？", "A.月に代わって<br>愛を届けるわ！", "B.月に代わって<br>おしおきよ！", "C.月のように輝くわ！", "D.月を見て戦うわ！"], ans: "B", explain: "セーラームーンに変身した月野うさぎが、敵と相対した決めポーズの際に発する代表的な決め台詞が「月に代わっておしおきよ！」。"},
{q: "第39問", difficulty: "veryhard", choices: ["『AKIRA』の原作漫画が連載されていた雑誌は？", "A.週刊少年ジャンプ", "B.週刊少年サンデー", "C.週刊ヤングマガジン", "D.月刊アフタヌーン"], ans: "C", explain: "大友克洋によるSF漫画『AKIRA』は、講談社発行の「週刊ヤングマガジン」にて1982年から1990年まで連載された。"},
{q: "第40問", difficulty: "hard", choices: ["『宝石の国』で、主人公フォスフォフィライトの硬度は？", "A.5.5", "B.7", "C.10", "D.3.5"], ans: "D", explain: "フォスフォフィライトはモース硬度が「3.5」と非常に脆く、衝撃に弱い身体のため他の宝石たちのような戦闘に向かない悩みを持っていた。"},
{q: "第41問", difficulty: "normal", choices: ["『黒子のバスケ』で、黒子テツヤの元相棒は？", "A.青峰大輝", "B.火神大我", "C.黄瀬涼太", "D.緑間真太郎"], ans: "A", explain: "青峰大輝は帝光中学「キセキの世代」のエースであり、影としてパスを供給していた黒子テツヤのかつての相棒（光）だった。"},
{q: "第42問", difficulty: "easy", choices: ["『ドラゴンボール』で、孫悟空がクリリンとともに本格的な修行を受けた武道家は？", "A.界王様", "B.亀仙人", "C.神様", "D.ウイス"], ans: "B", explain: "亀仙人（武天長老）は亀仙流の創始者であり、若き日の孫悟空とクリリンを弟子に取り、重い亀の甲羅を背負わせるなどの修業を課した。"},
{q: "第43問", difficulty: "veryhard", choices: ["『ルパン三世』第1シリーズの後半で、演出を担当した人物として知られるのは？", "A.庵野秀明", "B.押井守", "C.宮崎駿", "D.富野由悠季"], ans: "C", explain: "宮崎駿は高畑勲らとともに『ルパン三世』TV第1シリーズ後半の演出を担当し、作品の方向性に大きな影響を与えた。"},
{q: "第44問", difficulty: "hard", choices: ["『カウボーイビバップ』の主人公、スパイク・スピーゲルがかつて所属していた組織は？", "A.ホワイトスネイク", "B.ブルーローズ", "C.ブラックフェザー", "D.レッドドラゴン"], ans: "D", explain: "スパイクはバウンティハンター（賞金稼ぎ）になる以前、チャイニーズマフィア「レッドドラゴン」の幹部として活動していた過去を持つ。"},
{q: "第45問", difficulty: "normal", choices: ["『HUNTER×HUNTER』の主人公ゴンの目的は？", "A.父親ジンに会うこと", "B.金持ちになること", "C.ハンターになること", "D.幻影旅団を倒すこと"], ans: "A", explain: "ゴン＝フリークスは自身を置いて旅立った父親のジン＝フリークスを探し出し、会うためにハンター試験を受けて冒険に出た。"},
{q: "第46問", difficulty: "easy", choices: ["『進撃の巨人』で、人類が居住する3つの壁の名前は？", "A.三重の壁", "B.マリア、ローゼ、シーナ", "C.大きな壁", "D.防衛壁"], ans: "B", explain: "巨人の侵入を防ぐために築かれた三重の壁は、外側から「ウォール・マリア」「ウォール・ローゼ」「ウォール・シーナ」と呼ばれる。"},
{q: "第47問", difficulty: "veryhard", choices: ["『伝説巨神イデオン』の劇中で登場する、全滅の引き金と<br>なるエネルギーは？", "A.フォース", "B.ゲッター線", "C.イデ", "D.アトミカ"], ans: "C", explain: "イデは強大なエネルギーで、物語の中で人類と異星文明の争いに深く関わる重要な力として描かれている。"},
{q: "第48問", difficulty: "hard", choices: ["『少女革命ウテナ』で、ウテナが所属する学園の名称は？", "A.星ノ森学園", "B.聖マリア学園", "C.常盤台中学", "D.鳳学園"], ans: "D", explain: "天上ウテナが転校してきた「鳳学園」は、男装の彼女が「薔薇の嫁」と呼ばれる生徒姫宮アンシーを巡る決闘に巻き込まれる舞台となる。"},
{q: "第49問", difficulty: "normal", choices: ["『PSYCHO-PASS サイコパス』で、犯罪係数を測定する<br>銃の名前は？", "A.ドミネーター", "B.エリミネーター", "C.サイコガン", "D.ビームサーベル"], ans: "A", explain: "ドミネーターはシビュラシステムと連携し、対象者の犯罪係数を瞬時に測定して、危険度に応じたモードに自動変化する特殊な銃器。"},
{q: "第50問", difficulty: "hard", choices: ["『serial experiments lain』の主人公、<br>玲音が最初に使用していたコンピューターは？", "A.iMac", "B.NAVI", "C.VAIO", "D.PC-98"], ans: "B", explain: "作品世界において情報端末は「NAVI（ナビ）」と呼ばれており、玲音が初期に使用していたのは児童向けデザインの赤いNAVIだった。"},
{q: "第51問", difficulty: "easy", choices: ["『ちびまる子ちゃん』の主人公まる子の本名は？", "A.さくらさきこ", "B.さくらすみれ", "C.さくらももこ", "D.さくらともぞう"], ans: "C", explain: "「ちびまる子ちゃん」こと主人公の本名は「さくらももこ」。原作者自身の少女時代をモデルにしたエッセイ風作品となっている。"},
{q: "第52問", difficulty: "easy", choices: ["『SPY×FAMILY』で、超能力（心を読む力）を<br>持つ少女の名前は？", "A.ヨル", "B.フィオナ", "C.ベッキー", "D.アーニャ"], ans: "D", explain: "アーニャ・フォージャーは組織の実験によって他人の心を読めるようになった少女。ロイドに引き取られ仮初めの娘として生活する。"},
{q: "第53問", difficulty: "easy", choices: ["『暗殺教室』で、3年E組の担任を務める<br>黄色いタコ型の超生物は？", "A.殺せんせー", "B.烏間先生", "C.ビッチ先生", "D.死神"], ans: "A", explain: "最高速度マッハ20で移動する謎の超生物で、生徒たちから「殺せない先生」にちなんで「殺せんせー」と命名された。"},
{q: "第54問", difficulty: "easy", choices: ["『かぐや様は告らせたい』の舞台となる超名門校の名前は？", "A.音ノ木坂学院", "B.秀知院学園", "C.開盟学園", "D.椚ヶ丘中学校"], ans: "B", explain: "秀知院学園（しゅうちいんがくえん）は、将来を期待された名門家系や富裕層の生徒が集まる、作中の舞台となる超名門校。"},
{q: "第55問", difficulty: "easy", choices: ["『僕のヒーローアカデミア』で、主人公の緑谷出久が<br>受け継いだ個性の名前は？", "A.オール・フォー・ワン", "B.爆破", "C.ワン・フォー・オール", "D.半冷半燃"], ans: "C", explain: "「ワン・フォー・オール」は力をストックし人から人へ引き継ぐ能力。無個性だった緑谷出久はオールマイトからこの能力を受け継いだ。"},
{q: "第56問", difficulty: "normal", choices: ["『ソードアート・オンライン』の主人公キリトがゲーム内で呼ばれていた二つ名は？", "A.閃光", "B.絶剣", "C.黒の魔王", "D.黒の剣士"], ans: "D", explain: "キリトは黒を基調とした装備を愛用し、ソロで前線に立ち続けたことから「黒の剣士」という二つ名で恐れられ親しまれた。"},
{q: "第57問", difficulty: "normal", choices: ["『とある魔術の禁書目録』の主人公<br>上条当麻の右手に宿る能力は？", "A.幻想殺し<br>（イマジンブレイカー）", "B.一方通行<br>（アクセラレータ）", "C.超電磁砲（レールガン）", "D.神浄の討魔"], ans: "A", explain: "「幻想殺し」は異能の力を無効化する右手の能力。魔術や超能力を触れるだけで打ち消すことができるが、自身の幸運も打ち消してしまう。"},
{q: "第58問", difficulty: "normal", choices: ["『シュタインズ・ゲート』で、<br>主人公・岡部倫太郎が自称する二つ名は？", "A.閃光のルルーシュ", "B.鳳凰院凶真", "C.漆黒の翼", "D.漆黒のフォトン"], ans: "B", explain: "岡部倫太郎は重度の厨二病であり、自らを狂気の狂気のマッドサイエンティスト「鳳凰院凶真（ほうおういんきょうま）」と名乗っている。"},
{q: "第59問", difficulty: "normal", choices: ["『五等分の花嫁』で、五つ子の中で長女（一番上）は誰？", "A.二乃", "B.三玖", "C.一花", "D.四葉"], ans: "C", explain: "中野家のアニメや原作における長女は中野一花（いちか）。五つ子の中ではお姉さん気質で、面倒見が良い性格をしている。"},
{q: "第60問", difficulty: "normal", choices: ["『Re:ゼロから始める異世界生活』で、<br>主人公スバルが持つ能力は？", "A.タイムリープ", "B.絶対遵守の力", "C.全知全能", "D.死に戻り"], ans: "D", explain: "ナツキ・スバルが異世界で得た能力「死に戻り」は、自身が命を落とした際に過去の一定のチェックポイントまで時間を巻き戻す能力。"},
{q: "第61問", difficulty: "hard", choices: ["『交響詩篇エウレカセブン』で、ゲッコーステイトの<br>リーダーであり、月光号の艦長を務める人物は？", "A.タルホ・ユーキ", "B.デューイ・ノヴァク", "C.ホランド・ノヴァク", "D.アネモネ"], ans: "C", explain: "ホランド・ノヴァクは反政府組織「ゲッコーステイト」のリーダーで月光号の艦長。主人公レントンが憧れる卓越したLFOパイロット。"},
{q: "第62問", difficulty: "hard", choices: ["『CLANNAD』で、古河渚が大好きな歌は？", "A.ウサギファミリー", "B.だんご大家族", "C.クマのパン屋さん", "D.ヒトデ一家"], ans: "B", explain: "「だんご大家族」は作中に登場する大人気キャラクターソング。ヒロインの古河渚が非常に気に入っており、作中でも印象的に歌われる。"},
{q: "第63問", difficulty: "hard", choices: ["『化物語』で、主人公の阿良々木暦が最初に助けた<br>吸血鬼の“完全体の呼称”は？", "A.キスシップ", "B.忍野忍", "C.キスショット", "D.エピソード"], ans: "C", explain: "キスショットは忍野忍の本来の名前で、作中で重要な役割を持つ吸血鬼の完全体の呼称。"},
{q: "第64問", difficulty: "hard", choices: ["『涼宮ハルヒの憂鬱』で、SOS団が文化祭で上映した<br>自主制作映画の作中タイトルは？", "A.涼宮ハルヒの憂鬱", "B.孤島症候群", "C.サムデイ イン ザ レイン", "D.朝比奈ミクルの冒険"], ans: "D", explain: "SOS団が県立北高校の文化祭で上映した自主制作映画のタイトルは『朝比奈ミクルの冒険 Episode00』。ハルヒ監督による破天荒な映画。"},
{q: "第65問", difficulty: "hard", choices: ["『Mob Psycho 100（モブサイコ100）』の<br>主人公・影山茂夫が通う中学校の名前は？", "A.塩中学校", "B.黒酢中学校", "C.味の素中学校", "D.醤油中学校"], ans: "A", explain: "主人公のモブこと影山茂夫が通っている学校は「塩中学校」。ライバル校として「黒酢中学校」などの調味料にちなんだ学校が登場する。"},
{q: "第66問", difficulty: "hard", choices: ["『血界戦線』で、主人公レオナルド・ウォッチが持つ<br>「神々の義眼」と引き換えに視力を失った妹の名前は？", "A.ホワイト", "B.ミシェーラ", "C.チェイン", "D.K・K"], ans: "B", explain: "ミシェーラはレオナルドの妹。謎の存在から提示された対価として、兄のかわりに自身の視力を差し出すことで兄に義眼をもたらした。"},
{q: "第67問", difficulty: "hard", choices: ["『SHIROBAKO』で、主人公・宮森あおいが<br>武蔵野アニメーションで就いている役職は？", "A.原画作画", "B.3D監督", "C.制作進行", "D.音響監督"], ans: "C", explain: "宮森あおいはアニメ制作会社「武蔵野アニメーション」で制作進行を担当。スケジュール管理や各セクションとの調整に日々奮闘する。"},
{q: "第68問", difficulty: "hard", choices: ["『メイドインアビス』で、大穴「アビス」の最深部を目指す探窟家の最高位の称号は？", "A.黒笛", "B.月笛", "C.赤笛", "D.白笛"], ans: "D", explain: "探窟家は等級ごとに笛の色が異なり、最高位である「白笛」は深層への探窟を行う伝説的な探窟家たちが持つ。"},
{q: "第69問", difficulty: "hard", choices: ["『ピンポン』で、ペコこと星野裕とスマイルこと月本誠が<br>通う高校の名前は？", "A.片瀬高校", "B.海王学園", "C.辻堂学院", "D.湘南高校"], ans: "A", explain: "幼馴染のペコ（星野裕）とスマイル（月本誠）の二人が進学し、卓球部でともにプレーすることになった学校が神奈川県の「片瀬高校」。"},
{q: "第70問", difficulty: "veryhard", choices: ["『ゼーガペイン』で、主人公ソゴル・キョウたちが戦う舞台となっている人工空間（サーバー）の名前は？", "A.東京サーバー", "B.舞浜サーバー", "C.千葉サーバー", "D.浦安サーバー"], ans: "B", explain: "舞浜サーバーは作中に登場する人工空間で、主人公たちの生活や戦いの舞台となる重要なデータ世界。"},
{q: "第71問", difficulty: "veryhard", choices: ["『電脳コイル』で、電子ペットや電脳物質を駆除・消去する行政の防衛プログラムの名前は？", "A.イリーガル", "B.ヌル", "C.サッチー", "D.キュウちゃん"], ans: "C", explain: "「サッチー（正式名称：サーチトン）」は市役所の郵政局が管轄するアンチウイルスプログラム。違法な電脳バグを容赦なくフォーマットする。"},
{q: "第72問", difficulty: "veryhard", choices: ["『TEXHNOLYZE（テクノライズ）』で、<br>舞台となる地下都市の名前は？", "A.ルガ", "B.リュウセイ", "C.リュウドウ", "D.ルクス（Lukuss）"], ans: "D", explain: "『TEXHNOLYZE』の舞台となる「ルクス」は、絶望的な世界観の中で義体化技術テクノライズが普及している暗鬱な地下都市。"},
{q: "第73問", difficulty: "veryhard", choices: ["『モノノ怪』で、薬売りが「モノノ怪」を斬るために<br>解き明かさなければならない3つの要素は？", "A.形・真・理", "B.心・技・体", "C.生・死・因", "D.過去・現在・未来"], ans: "A", explain: "薬売りが退魔の剣を抜くためには、アヤカシの様相である「形（カタチ）」、事件の真相である「真（マコト）」、心の情念である「理（コトワリ）」が必要。"},
{q: "第74問", difficulty: "veryhard", choices: ["『無限のリヴァイアス』で、航宙可潜艦「リヴァイアス」を稼働させている謎の生体メインシステムの名は？", "A.スフィンクス", "B.ネーヤ", "C.ヴァール", "D.イクス"], ans: "B", explain: "ネーヤは艦内をあてもなく彷徨うピンク色の髪の少女の姿をした存在で、リヴァイアスの「スフィクス」と呼ばれる謎の存在。"},
{q: "第75問", difficulty: "veryhard", choices: ["『東のエデン』で、セレソンたちに100億円の電子マネーが入った携帯電話を与えた人物の名前は？", "A.ジュイス", "B.Mr.OUTSIDE", "C.滝沢朗", "D.物部大樹"], ans: "B", explain: "「Mr.OUTSIDE（ミスター・アウトサイド）」は、選ばれた12人の「セレソン」に100億円を与え、日本を救う義務を課した正体不明のゲーム主催者。"},
{q: "第76問", difficulty: "veryhard", choices: ["『オッドタクシー』で、主人公のタクシー運転手・小戸川が乗っているタクシーの車種は？", "A.セドリック", "B.ジャパンタクシー", "C.プリウス", "D.クラウンコンフォート"], ans: "D", explain: "主人公の小戸川が日常の営業業務で乗車・運転しているタクシーの車種は、現実の日本でも定番である「トヨタ・クラウンコンフォート」。"},
{q: "第77問", difficulty: "veryhard", choices: ["『プラネテス』で、主人公ハチマキたちが所属する<br>デブリ課の通称は？", "A.半課", "B.ゴミ課", "C.底辺課", "D.零課"], ans: "A", explain: "宇宙ゴミ（デブリ）回収を担当する事業課は、社内で不要と見なされ予算も人員も半人前扱いされていることから「半課」と蔑称されていた。"},
{q: "第78問", difficulty: "veryhard", choices: ["『四畳半神話大系』で、主人公の「私」と悪友・小津が<br>師事する、何でも屋の師匠の名前は？", "A.城ヶ崎マサキ", "B.樋口清太郎", "C.羽貫涼子", "D.相石和彦"], ans: "B", explain: "樋口清太郎は下鴨幽水荘に住む謎多き大学8回生。「私」や小津から「師匠」と仰がれ、どこか悟ったような浮世離れした雰囲気を纏っている。"},
{q: "第79問", difficulty: "veryhard", choices: ["『楽園追放 -Expelled from Paradise-』で、人類の大半が<br>肉体を捨てて暮らしている電脳世界の名は？", "A.アーク", "B.エデン", "C.ディーヴァ", "D.マトリックス"], ans: "C", explain: "「ディーヴァ」はナノマシン技術により肉体をデータ化し、精神データのみで人類が生活している地球周回軌道上の電脳世界。"},
{q: "第80問", difficulty: "veryhard", choices: ["『トップをねらえ！』で、タカヤ・ノリコと<br>アマノ・カズミが所属する部隊の正式な部隊名は？", "A.コーチ特訓部隊", "B.銀河ヒッチハイク部隊", "C.宇宙パイロット養成部隊", "D.トップ部隊"], ans: "D", explain: "主人公のノリコたちが沖縄女子宇宙高校から選抜され、宇宙戦艦ヱクセリヲンに配置されたエリートパイロット部隊の名称が「トップ部隊」。"}
];
if(tf.diff == null) tf.diff = "easy";
// 難易度フィルタリング
tf.filtered = tf.all_questions.filter(function(q) {
var level = q.difficulty || "easy";
if(tf.diff == "easy") return level == "easy";
if(tf.diff == "normal") return (level == "easy" || level == "normal");
if(tf.diff == "hard") return (level == "easy" || level == "normal" || level == "hard");
return true;
});
// 配列シャッフル
for (var i = tf.filtered.length - 1; i > 0; i--) {
var j = Math.floor(Math.random() * (i + 1));
var temp = tf.filtered[i];
tf.filtered[i] = tf.filtered[j];
tf.filtered[j] = temp;
}
// デバッグモード判定
if(tf.debug_mode == true){
if(tf.debug_all == true){
tf.selected_questions = tf.all_questions;
tf.question_count = tf.all_questions.length;
} else {
var debugQuestion = tf.all_questions.find(function(q){
return q.q == "第" + tf.debug_question + "問";
});
if(debugQuestion){
tf.selected_questions = [debugQuestion];
tf.question_count = 1;
}
}
} else {
tf.selected_questions = tf.filtered.slice(0, tf.question_count);
}
tf.current_index = 0;
tf.score = 0;
// 設定値初期化
if(tf.diff == "easy"){
tf.max_life = 5;
tf.time_limit = 60;
tf.hint_count = 5;
tf.current_bg = 'haikei/easy_haikei.png';
} else if(tf.diff == "normal"){
tf.max_life = 3;
tf.time_limit = 60;
tf.hint_count = 3;
tf.current_bg = 'haikei/normal_haikei.png';
} else if(tf.diff == "hard"){
tf.max_life = 2;
tf.time_limit = 60;
tf.hint_count = 1;
tf.current_bg = 'haikei/hard_haikei.png';
} else if(tf.diff == "veryhard"){
tf.max_life = 1;
tf.time_limit = 60;
tf.hint_count = 0;
tf.current_bg = 'haikei/very_hard_haikei.png';
}
if(tf.debug_mode == true){
if(tf.debug_bg) tf.current_bg = tf.debug_bg;
tf.hint_count = 999;
}
tf.life = tf.max_life;
[endscript]

[call  storage="loading_scene.ks"  target="*loading_start"  ]
[image layer="base" storage="&tf.current_bg" time="800"]

[playbgm  storage="bgm1.ogg"  ]

; 初回判定


[jump  cond="!sf.tutorial_seen"  target="*tutorial_scene"  storage=""  ]
[dialog type="confirm" text="チュートリアルを再生しますか？" target="*tutorial_scene" target_cancel="*welcome_scene" label_ok="はい" label_cancel="いいえ"]

[s  ]

; --- 3. チュートリアル専用 ---


*tutorial_scene

[iscript]
if(tf.diff == "easy") { tf.diff_name = "イージー"; }
else if(tf.diff == "normal") { tf.diff_name = "ノーマル"; }
else if(tf.diff == "hard") { tf.diff_name = "ハード"; }
else if(tf.diff == "veryhard") { tf.diff_name = "ベリーハード"; }
f.chara_img = "zunda/" + sf.selected_chara + "_normal.png";
f.tutorial_voice1 = "voice/" + sf.selected_chara + "/tutorial_voice1_" + tf.diff + ".ogg";
f.tutorial_voice2 = "voice/" + sf.selected_chara + "/tutorial_voice2_" + tf.diff + ".ogg";
f.tutorial_voice3 = "voice/" + sf.selected_chara + "/tutorial_voice3_" + tf.diff + ".ogg";
[endscript]

[layopt layer="1" visible="true"]

[cm  ]
[image storage="&f.chara_img" layer="1" x="440" y="100" width="400" name="chara_stand"]

[tb_show_message_window  ]
[playse  storage="&f.tutorial_voice1"  ]

新クイズで遊ぼう！の世界へようこそ！[p]
クイズは各難易度毎に20問がランダムで最大10問が出題されます[p]
4つの選択肢から1つを選んで正解を見つけてね！[p]
次はライフについて説明するよ[p]


[tb_hide_message_window  ]
[anim  name="chara_stand"  left="900"  time="1000"  ]
[wa  ]
[tb_show_message_window  ]

左上に表示されているのがライフとなります[p]
選択を間違えると左上のライフが減っちゃうよ[p]
ライフが全部なくなるとそこで終了となるので注意してね！[p]
次は制限時間について説明するよ[p]
画面の上に表示しているのが制限時間です[p]
ゲージが0になるとライフが1つ減るので注意してね[p]
次はヒントの説明をするよ[p]
画面右下に表示されているのがヒントです[p]
ヒントは難易度によって使用回数が決まっていますが[p]
4つの選択肢を2つにしてくれる素晴らしいヒントです[p]
問題で分からなかったら遠慮なく使用してみてください[p]
※説明書の中にLIFEの個数やヒントの使用回数を記載してありますのでそちらをお読みください。[p]
以上！チュートリアルが終わります！ クイズを楽しんでいてね！[p]


[tb_hide_message_window  ]
[freeimage layer="1"]

[eval exp="sf.tutorial_seen = true"]

[jump  target="*question_loop"  storage=""  ]

; --- 4. ウェルカム演出 ---


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

[cm  ]
[tb_show_message_window  ]
[playse  storage="&f.voice1"  ]

ようこそ！新クイズで遊ぼう！の世界へ！[p]


[emb exp="tf.diff_name"]

[playse  storage="&f.voice2"  ]

の問題は全20問がランダムで10問選択されて出題されます[p]
4つの選択肢から1つを選んで正解を見つけてね！[p]


[playse  storage="&f.voice3"  ]

では、クイズを始めるよ！[p]


[tb_hide_message_window  ]
[anim  name="chara_stand"  left="900"  time="1000"  ]
[wa  ]
[freeimage layer="1"]

[eval exp="sf.tutorial_seen = true"]

[jump  target="*question_loop"  storage=""  ]

; --- 5. ライフ表示処理（サブルーチン） ---


*show_life

[free layer="2" name="life_heart"]

[iscript]
tf.h1 = (tf.life >= 1) ? "UI/heart1.png" : "UI/heart01.png";
tf.h2 = (tf.life >= 2) ? "UI/heart1.png" : "UI/heart01.png";
tf.h3 = (tf.life >= 3) ? "UI/heart1.png" : "UI/heart01.png";
tf.h4 = (tf.life >= 4) ? "UI/heart1.png" : "UI/heart01.png";
tf.h5 = (tf.life >= 5) ? "UI/heart1.png" : "UI/heart01.png";
[endscript]

[image layer="2" name="life_heart" storage="&tf.h1" x="40" y="40" width="50" height="50" cond="tf.max_life >= 1"]

[image layer="2" name="life_heart" storage="&tf.h2" x="100" y="40" width="50" height="50" cond="tf.max_life >= 2"]

[image layer="2" name="life_heart" storage="&tf.h3" x="160" y="40" width="50" height="50" cond="tf.max_life >= 3"]

[image layer="2" name="life_heart" storage="&tf.h4" x="220" y="40" width="50" height="50" cond="tf.max_life >= 4"]

[image layer="2" name="life_heart" storage="&tf.h5" x="280" y="40" width="50" height="50" cond="tf.max_life >= 5"]

[return  ]

; --- 6. クイズループ ---


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
// クイズデータと難易度の初期化（※タイマー変数はここではセットだけ行います）
tf.time_limit = 60;
tf.time_left = tf.time_limit;
tf.anim_time = tf.time_limit * 1250;

var q = tf.selected_questions[tf.current_index];
tf.q_title = "第" + (tf.current_index + 1) + "問：";
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
[endscript]

; 2. 画面レイアウトと問題タイトルの表示
[call target="*show_life" storage=""]
[cm]
[layopt layer="1" visible="true"]
[image storage="&f.chara_img" layer="1" x="900" y="100" width="400" name="chara_stand"]


[image layer="2" storage="UI/bar_hk.png" x="410" y="70" name="time_bar_hk" width="470" height="70"]
[image layer="2" storage="UI/gage.png" x="425" y="70" name="time_gage" width="450" height="70"]
[image layer="2" storage="UI/time_cover.png" x="320" y="15" name="time_cover" width="600" height="150"]

[tb_show_message_window]
[emb exp="tf.q_title"]
[p]

[layopt layer="2" visible="true"]
[ptext layer="2" name="question_text" text="&tf.q_text" x="350" y="180" size="22" color="0x000000" width="600" align="center"]

[iscript]
$(".question_text").css({
"background-color": "rgba(255, 255, 255, 0.85)",
"padding": "15px 20px",
"border-radius": "15px",
"box-shadow": "0px 4px 10px rgba(0,0,0,0.1)"
});
[endscript]

[tb_hide_message_window]


[iscript]
// 基準点の設定
$(".time_gage").css({
    "transform-origin": "left center",
    "object-position": "left center",
    "object-fit": "cover"
});
[endscript]

; ★ 3. タイマー＆ゲージアニメーションスタート
[iscript]
if(tf.timer_id) clearInterval(tf.timer_id);
tf.time_left = tf.time_limit || 60;

tf.timer_id = setInterval(function(){
    tf.time_left--;
    
    if(tf.time_left <= 1){
        $(".time_gage").css("opacity", "0");
    }

    if (tf.time_left > 10 && tf.time_left > 0) {
        TYRANO.kag.ftag.startTag("playse", { storage: "timer1.ogg", stop: true });
    } else if (tf.time_left <= 10 && tf.time_left > 0) {
        TYRANO.kag.ftag.startTag("playse", { storage: "timer2.ogg", stop: true });
    }

    if(tf.time_left <= 0){
        clearInterval(tf.timer_id);
        $(".time_gage").stop(true, false).hide();
        TYRANO.kag.ftag.startTag("playse", { storage: "time_up.ogg" });
        
        TYRANO.kag.stat.is_strong_stop = false;
        TYRANO.kag.layer.showEventLayer();
        TYRANO.kag.ftag.startTag("jump", { target: "*time_up" });
    }
}, 1000);
[endscript]

; ゲージアニメーション開始
[anim name="time_gage" width="0" time="&tf.anim_time" cond="tf.debug_mode !== true"]

*show_choices

[cm  ]
[tb_hide_message_window  ]
[glink  color="black"  target="*check_answer"  text="&tf.shuffled[0]"  size="20"  x="250"  y="300"  width="250"  exp="tf.choice_num=0"  cond="tf.show0"  ]
[glink  color="black"  target="*check_answer"  text="&tf.shuffled[1]"  size="20"  x="680"  y="300"  width="250"  exp="tf.choice_num=1"  cond="tf.show1"  ]
[glink  color="black"  target="*check_answer"  text="&tf.shuffled[2]"  size="20"  x="250"  y="420"  width="250"  exp="tf.choice_num=2"  cond="tf.show2"  ]
[glink  color="black"  target="*check_answer"  text="&tf.shuffled[3]"  size="20"  x="680"  y="420"  width="250"  exp="tf.choice_num=3"  cond="tf.show3"  ]
[free layer="2" name="hint_btn"]

[button  storage=""  target="*use_hint"  graphic="button/button1.png"  enterimg="button/button01.png"  x="1000"  y="600"  name="hint_btn"  ]
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
[endscript]

[s  ]

; --- ヒント処理 ---

*use_hint

[iscript]
// ★ ボタンが押されていない状態（残数0または使用済み）での誤作動をブロック
if (tf.hint_count > 0 && !tf.hint_used) {
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
    tf.show0 = (tf.shuffled[0] !== "");
    tf.show1 = (tf.shuffled[1] !== "");
    tf.show2 = (tf.shuffled[2] !== "");
    tf.show3 = (tf.shuffled[3] !== "");
}
[endscript]

[iscript]
if(tf.hint_used == true){
    $(".hint_btn img").css({
        "filter": "grayscale(100%)",
        "opacity": "0.5"
    });
    $(".hint_btn").css("pointer-events", "none");
}
[endscript]

[jump target="*show_choices" storage=""]

; --- 7. 判定・終了 ---

*check_answer

[cm]
[tb_show_message_window]
[iscript]
tf.user_choice = tf.shuffled[tf.choice_num];
if(tf.user_choice == tf.correct_text){
    tf.ans_target = "*ans_correct";
} else {
    tf.ans_target = "*ans_wrong";
}
[endscript]

[jump target="&tf.ans_target" storage=""]

; --- 正解処理 ---

*ans_correct

[iscript]
clearInterval(tf.timer_id);
$(".time_gage").stop(true, false);
[endscript]

[eval exp="tf.score++"]

正解！！[r]答えは「[emb exp="tf.correct_text"]」でした。[p]

「解説：[emb exp='tf.selected_questions[tf.current_index].explain']」[p]

[jump target="*next_question_check" storage=""]

; --- 不正解処理 ---

*ans_wrong

[iscript]
clearInterval(tf.timer_id);
$(".time_gage").stop(true, false);
[endscript]

[eval exp="tf.life--"]

[iscript]
if(tf.life < 0){ tf.life = 0; }
[endscript]

[call target="*show_life" storage=""]

残念、不正解…[r]正解は「[emb exp="tf.correct_text"]」でした。[p]

「解説：[emb exp='tf.selected_questions[tf.current_index].explain']」[p]

[jump target="*next_question_check" storage=""]

*next_question_check

[iscript]
clearInterval(tf.timer_id);
$(".time_gage").stop(true, false);
if(tf.life <= 0){
    tf.next_target = "*game_over";
} else {
    tf.next_target = "*go_next";
}
[endscript]

[free layer="2" name="time_gage"]
[free layer="2" name="time_cover"]
[free layer="2" name="time_bar_hk"]
[free layer="2" name="question_text"]
[free layer="2" name="hint_btn"]

[jump target="&tf.next_target" storage=""]

*go_next

[freeimage layer="1"]
[eval exp="tf.current_index++"]
[jump target="*question_loop" storage=""]

; --- 時間切れ処理 ---

*time_up

[cm]
[tb_show_message_window]

時間切れ！[r]
正解は「[emb exp="tf.correct_text"]」でした。[p]

「解説：[emb exp='tf.selected_questions[tf.current_index].explain']」[p]

[eval exp="tf.life--"]
[call target="*show_life" storage=""]
[jump target="*next_question_check" storage=""]

; --- ゲーム終了処理 ---

*game_over

[free name="time_bar_hk" layer="2"]
[free name="life_heart" layer="2"]
[free layer="2" name="question_text"]
[free layer="2" name="hint_btn"]

[cm]
[tb_show_message_window]

クイズ終了…！[p]

[jump target="*quiz_end" storage=""]

*quiz_end

[cm]
[tb_show_message_window]

貴方は[emb exp="tf.question_count"]点中[p][emb exp="tf.score"]点です！[p]

[eval exp="sf.genre_unlocked = true"]
[eval exp="sf.normal_unlocked = true"]
[eval exp="sf.hard_unlocked = true"]

[tb_hide_message_window]
[freeimage layer="2"]
[freeimage layer="1"]

[jump storage="title_screen.ks" target="*game_end"]
