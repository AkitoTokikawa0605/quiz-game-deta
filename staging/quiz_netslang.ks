[_tb_system_call storage=system/_quiz_netslang.ks]


; --- 1. 難易度選択 ---

*difficulty_select

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
tf.current_genre = tf.current_genre || 'netslang';

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
{q: "第1問", difficulty: "easy", choices: ["「笑える」という意味で使われる「草」の由来は？", "A.wが草に見えるから", "B.草食系だから", "C.草むらに隠れるから", "D.草を食べるから"], ans: "A", explain: "笑いを表す「w」を連続して入力した「www」が芝生や草のように見えたことから、「草」と呼ばれるようになった。"},
{q: "第2問", difficulty: "easy", choices: ["「炎上」とはどういう状態のこと？", "A.火事を消すこと", "B.ネットで批判が殺到すること", "C.料理を焦がすこと", "D.キャンプをすること"], ans: "B", explain: "SNSや掲示板などで非難や批判が大量に集まり、収拾がつかなくなっている状態を、火事に例えた表現。"},
{q: "第3問", difficulty: "easy", choices: ["「推し」とはどういう意味？", "A.押してほしい場所", "B.一番応援している人やキャラクター", "C.力ずくで動かすこと", "D.重い荷物"], ans: "B", explain: "自分が特に応援している人物やキャラクターを指す言葉で、アイドル・アニメなど幅広い分野で使われる。"},
{q: "第4問", difficulty: "easy", choices: ["「オワコン」とは？", "A.終わったコンテンツ", "B.追いかけたいコンテンツ", "C.美味しいこんぶ", "D.面白いコンサート"], ans: "A", explain: "「終わったコンテンツ」の略で、かつて流行したものの、現在は人気や話題性が低下したサービスや作品などを指す言葉。"},
{q: "第5問", difficulty: "easy", choices: ["「神回」とは？", "A.神様が出る回", "B.非常に素晴らしい出来の回", "C.神様の話", "D.神妙な顔つき"], ans: "B", explain: "演出・作画・展開などが特に優れていて、非常に素晴らしいと評価される放送回を称賛する言葉。"},
{q: "第6問", difficulty: "easy", choices: ["「ガチ」とはどういう意味？", "A.おふざけ", "B.本気", "C.冗談", "D.準備運動"], ans: "B", explain: "本気・真剣という意味で使われる言葉。「ガチでやる」「ガチ勢」などの形で、真剣に取り組むことや本気の状態を表す。"},
{q: "第7問", difficulty: "easy", choices: ["ネットスラングで「乙」と書く場合、一般的に何を意味する？", "A.おつかれさま", "B.おと", "C.おつよい", "D.おめでとう"], ans: "A", explain: "「お疲れ様」を略した「おつ」が、同音の漢字「乙」に置き換わったネットスラング。投稿者や対戦相手への労いの言葉として使われる。"},
{q: "第8問", difficulty: "easy", choices: ["「既読スルー」とは？", "A.既読なのに返信しないこと", "B.既読して返信すること", "C.すぐに返信すること", "D.読まずに消すこと"], ans: "A", explain: "メッセージを読み「既読」がついたにもかかわらず、返信をせず放置すること。「既読無視」とも呼ばれる。"},
{q: "第9問", difficulty: "easy", choices: ["「マジレス」とは？", "A.マジでレスリングすること", "B.冗談やネタに対して真面目に返信すること", "C.マジなレストラン", "D.嘘の返信"], ans: "B", explain: "「マジ（真面目）」な「レス（返信）」を組み合わせた言葉。冗談やネタに対して真剣に返答することを指す。"},
{q: "第10問", difficulty: "easy", choices: ["「激おこ」の続きとして有名な言葉は？", "A.ぷんぷん丸", "B.むかむか", "C.いらいら", "D.わくわく"], ans: "A", explain: "怒りの度合いを表すギャル語。「激おこぷんぷん丸」などの派生表現が有名になった。"},
{q: "第11問", difficulty: "easy", choices: ["ネットスラングで「垢（あか）」とは？", "A.垢すり", "B.アカウント", "C.赤色", "D.明るい"], ans: "B", explain: "「アカウント」を略したネットスラング。本垢・サブ垢などの形で使われる。"},
{q: "第12問", difficulty: "easy", choices: ["ネットスラングで「優勝」とは、どのような意味で使われる？", "A.試合に勝つこと", "B.最高・素晴らしいという感情を表すこと", "C.運動会", "D.金メダル"], ans: "B", explain: "美味しい食事や最高の体験などをした際に、「完全に優勝した」のように、最高・素晴らしいという気持ちを表すために使われる。"},
{q: "第13問", difficulty: "easy", choices: ["「メンタル」とは？", "A.金属", "B.精神面", "C.面接", "D.麺類"], ans: "B", explain: "英語の「mental」に由来し、心や精神面、心理状態を表す言葉。「メンタルが強い」「メンタルがやられる」などの形で使われる。"},
{q: "第14問", difficulty: "easy", choices: ["ネットで「了解」をさらに短く表現すると？", "A.りょ", "B.り", "C.りょう", "D.了解です"], ans: "A", explain: "「了解」の前半を取った略語。「りょ」と短く返事をする形で使われ、さらに省略して「り」と表現することもある。"},
{q: "第15問", difficulty: "easy", choices: ["「黒歴史」という言葉がネット等で広まるきっかけとなったアニメ作品は？", "A.∀ガンダム", "B.新世紀エヴァンゲリオン", "C.コードギアス", "D.機動戦士ガンダム"], ans: "A", explain: "アニメ『∀ガンダム』の劇中用語が発祥。劇中では過去の戦争の歴史を指す言葉だったが、後に「人には知られたくない恥ずかしい過去」という意味でも使われるようになった。"},
{q: "第16問", difficulty: "easy", choices: ["SNSなどで投稿が急速に拡散・共有されて話題になることを何という？", "A.バズる", "B.バグる", "C.バザー", "D.バシる"], ans: "A", explain: "英語の「buzz」に由来し、SNSなどで情報や話題が急速に広がり、多くの人から注目を集めることを「バズる」という。"},
{q: "第17問", difficulty: "easy", choices: ["SNSで迷惑メールや不適切なメッセージを大量に送りつける行為を何と呼ぶ？", "A.スパム", "B.ハム", "C.ベーコン", "D.ロースト"], ans: "A", explain: "インターネット上で、無差別に大量に送られる迷惑なメッセージや広告などを「スパム」と呼ぶ。名称の由来には、缶詰のSPAMを繰り返し注文するコントが登場するイギリスのテレビ番組が関係しているとされる。"},
{q: "第18問", difficulty: "easy", choices: ["SNSなどで「返信（リプライ）」することを略して何という？", "A.リプ", "B.リフ", "C.リリ", "D.プラ"], ans: "A", explain: "英語の「reply（返信）」を略した言葉。「リプを送る」「リプ欄」などの形で広く使われている。"},
{q: "第19問", difficulty: "easy", choices: ["SNS等で相互フォローではない相手に連絡する際添える「FF外から失礼します」の「FF」とは？", "A.フォロー・フォロワー", "B.ファースト・ファイナル", "C.フリー・ファン", "D.フレンド・ファミリー"], ans: "A", explain: "「Follow / Follower（フォロー・フォロワー）」を略した表現。「FF外」は、自分がフォローしておらず、相手からもフォローされていないなど、フォロー関係にない相手を指す。"},
{q: "第20問", difficulty: "easy", choices: ["YouTubeのライブ配信などで、視聴者が配信者へ送る金銭的支援を何と呼ぶ？", "A.スパチャ", "B.スパム", "C.スーパーカード", "D.スパルタ"], ans: "A", explain: "YouTubeの投げ銭機能「Super Chat（スーパーチャット）」の略称。「スパチャ」と呼ばれ、ライブ配信などで視聴者が配信者を金銭的に支援するために利用される。"},
{q: "第21問", difficulty: "normal", choices: ["「kwsk」の意味は？", "A.帰ってくれ", "B.かわいそう", "C.詳しく", "D.怖い"], ans: "C", explain: "「詳しく」をローマ字表記した「kuwashiku」の子音を取り出したネットスラングで、詳しい説明を求める時などに使われる。"},
{q: "第22問", difficulty: "normal", choices: ["「飯テロ」とはどのような行為？", "A.食事をテロリストに提供する", "B.食事中に爆弾を仕掛ける", "C.料理をわざと捨てる", "D.深夜などに美味しそうな料理の画像や動画を投稿する"], ans: "D", explain: "空腹になりやすい深夜などに、食欲を刺激する料理の画像や動画を投稿して、他人の食欲を揺さぶる行為を指す。"},
{q: "第23問", difficulty: "normal", choices: ["「メンヘラ」の語源になった言葉は？", "A.麺を食べる人", "B.メンタルヘルス", "C.メンマが好きな人", "D.メンタルがヘラヘラしている人"], ans: "B", explain: "インターネット掲示板の「メンタルヘルス板」に集まる人々を指す「メンヘラー」が変化した言葉とされている。"},
{q: "第24問", difficulty: "normal", choices: ["「wktk」の読み方は？", "A.わくわく", "B.わかたか", "C.わくてか", "D.わかとき"], ans: "C", explain: "「ワクワクテカテカ」を略したネットスラングで、「わくてか」と読む。期待で胸が高鳴っている様子などを表す。"},
{q: "第25問", difficulty: "normal", choices: ["「中二病」の由来は？", "A.中学2年生の背伸びした言動を指す言葉", "B.中学2年生の病気", "C.給食を食べる病気", "D.中学2年生のランキング"], ans: "A", explain: "中学2年生頃にありがちな、背伸びした言動や自意識過剰な振る舞いを自虐的に表現したラジオ番組発祥の言葉。"},
{q: "第26問", difficulty: "normal", choices: ["SNSなどで「尊い」とは、どのような時に使う？", "A.お寺に行った時", "B.推しや好きな作品などが素晴らしく、強く心を動かされた時", "C.お金を拾った時", "D.偉い人を見た時"], ans: "B", explain: "推しや好きな作品などがあまりにも素晴らしく、愛おしいと感じたり強く心を動かされたりした際に使われる表現。"},
{q: "第27問", difficulty: "normal", choices: ["ネットスラングの「ニキ」の由来は？", "A.二木さん", "B.兄貴（アニキ）", "C.人気者", "D.煮込み"], ans: "B", explain: "「アニキ（兄貴）」に由来するネットスラング。頼りになる人物や特定の分野に詳しい人物への親しみを込めた呼称として使われる。"},
{q: "第28問", difficulty: "normal", choices: ["ネットスラングで「鯖（さば）」が指すものは？", "A.魚", "B.サーバー", "C.サービス", "D.サブアカウント"], ans: "B", explain: "コンピューターの「サーバー（Server）」を略した「サバ」に、同じ読みの「鯖」の漢字を当てたネットスラング。"},
{q: "第29問", difficulty: "normal", choices: ["「エモい」の語源として有力なのは？", "A.絵文字", "B.ええもん", "C.英語の「emotional（エモーショナル）」", "D.エモー"], ans: "C", explain: "英語の「emotional（エモーショナル）」に由来するという説が有力。切なさや懐かしさなど、言葉では表しにくい感情を抱いた時などに使われる。"},
{q: "第30問", difficulty: "normal", choices: ["「かまちょ」とは？", "A.かまぼこ大好き", "B.かまってほしい人", "C.鎌倉に行く人", "D.構わないでほしい人"], ans: "B", explain: "「かまってちょうだい」を略した言葉。誰かに構ってほしい人や、構ってもらいたがる様子を指す。"},
{q: "第31問", difficulty: "normal", choices: ["「沼る」とは？", "A.湿地に行く", "B.何かに深くハマって抜け出せなくなること", "C.泥遊びをする", "D.沼で釣りをする"], ans: "B", explain: "底なし沼に例え、趣味や作品、人物などに深くハマり、なかなか抜け出せなくなる状態を指す。"},
{q: "第32問", difficulty: "normal", choices: ["ネットスラング「オワタ」の元になったAA（アスキーアート）で表される文字は？", "A.（^o^）", "B.（´・ω・`）", "C.orz", "D.＼(^o^)／"], ans: "D", explain: "「＼(^o^)／」は「人生オワタ」などのフレーズとともに広まり、絶望的な状況を表すAAとして定着した。"},
{q: "第33問", difficulty: "normal", choices: ["「鯖落ち」とは？", "A.魚が落ちる", "B.サーバーがダウンして利用できなくなること", "C.サービスが落ちる", "D.サブキャラが落ちる"], ans: "B", explain: "「サーバーダウン」を意味する俗称。アクセス集中や障害などによってサーバーが正常に動作せず、サービスやWebサイトなどが利用できなくなることを指す。"},
{q: "第34問", difficulty: "normal", choices: ["ネットスラングで「○○民」と呼ぶ場合、一般的に何を指す？", "A.その場所・作品・サービスなどに集まる人々", "B.国民", "C.住民票を持つ人", "D.県民"], ans: "A", explain: "特定のネット掲示板やコミュニティ、SNS、作品などに集まるユーザーやファンを、そこに住む住民になぞらえて「〜民」と呼ぶ。"},
{q: "第35問", difficulty: "normal", choices: ["「ググる」とは？", "A.Googleで検索する", "B.グーを出す", "C.ぐーたらする", "D.ぐっと我慢する"], ans: "A", explain: "検索エンジン「Google」を使ってインターネット上の情報を検索することを意味する動詞化表現。"},
{q: "第36問", difficulty: "normal", choices: ["「ポチる」とは？", "A.犬を飼う", "B.ネット通販などで購入ボタンを押して商品を注文する", "C.ポチ袋をもらう", "D.点をつける"], ans: "B", explain: "ネットショッピングなどで購入ボタンを「ポチッ」とクリックして商品を注文する動作から生まれた動詞スラング。"},
{q: "第37問", difficulty: "normal", choices: ["ネット上で女性の振りをして行動する男性ユーザーを指す言葉は？", "A.ネカマ", "B.ネナベ", "C.オカマ", "D.バーチャル"], ans: "A", explain: "「ネットおかま」を略した言葉。インターネット上で女性のように振る舞う男性ユーザーを指す。"},
{q: "第38問", difficulty: "normal", choices: ["VTuberやキャラクターなどの声優や演者本人のことを指すネット用語は？", "A.中の人", "B.裏の人", "C.本体", "D.魂"], ans: "A", explain: "着ぐるみやキャラクターなどの「中にいる人（演者）」を指す表現。VTuberなどの演者本人を指して使われることもある。"},
{q: "第39問", difficulty: "normal", choices: ["SNS等で規約違反によりアカウントが停止・凍結されることを何と呼ぶ？", "A.垢バン（BAN）", "B.垢落ち", "C.垢キック", "D.垢ロック"], ans: "A", explain: "「垢（アカウント）」と、利用禁止や停止などを意味する「BAN（バン）」を組み合わせたネット用語。規約違反などによってアカウントが停止・凍結されることを指す。"},
{q: "第40問", difficulty: "normal", choices: ["番組やイベントなどを配信や放送と同時にリアルタイムで視聴・参加することを何という？", "A.リアタイ", "B.生アテ", "C.ナマ視聴", "D.リアルタイムズ"], ans: "A", explain: "「リアルタイム」を略した言葉。「リアタイする」「リアタイ視聴」などの表現で、配信や放送をその時間に合わせて視聴することを指す。"},
{q: "第41問", difficulty: "hard", choices: ["「禿同」の意味は？", "A.激しく同意", "B.ハゲている人が同意すること", "C.ハゲている人に同情する", "D.絶対に認めない"], ans: "A", explain: "「激しく同意（はげしくどうい）」を略したネットスラングで、強い賛同を示す際に使われる。"},
{q: "第42問", difficulty: "hard", choices: ["ネットスラングで「凸（とつ）」とは、主に何を意味する？", "A.時計を見ること", "B.凸凹の凸", "C.突撃すること", "D.特別に突っ込むこと"], ans: "C", explain: "「突撃（とつげき）」の略で、アポなし訪問や配信への突発参加など、相手のもとへ直接乗り込むような行為を指す。"},
{q: "第43問", difficulty: "hard", choices: ["「ROMる」とは？", "A.ロムを回す", "B.ローマに行く", "C.掲示板などで書き込みをせず閲覧だけすること", "D.ロボットになる"], ans: "C", explain: "「Read Only Member」に由来するネットスラングで、掲示板やオンラインコミュニティなどで書き込みをせず、閲覧だけすることを指す。"},
{q: "第44問", difficulty: "hard", choices: ["ネットスラングで「養分」とは、主にどういう人を指す？", "A.栄養をあげる人", "B.植物を育てる人", "C.他人や運営などの利益につながる形で、お金や資源を使う人", "D.給食費を払う人"], ans: "C", explain: "パチンコやオンラインゲームなどで、お金を使うことで運営や他のプレイヤーの利益につながる人を指す俗称。"},
{q: "第45問", difficulty: "hard", choices: ["「ktkr」の読み方・意味は？", "A.帰ってこれ", "B.かったこれ", "C.くたばれ", "D.キタコレ（来た、これ！）"], ans: "D", explain: "「キタコレ（来た、これ！）」の略で、待ち望んでいた展開や期待していたものが現れた時の喜びを表すネットスラング。"},
{q: "第46問", difficulty: "hard", choices: ["「メシウマ」とは、ネットスラングでどのような意味？", "A.美味しいご飯", "B.馬のご飯", "C.他人の不幸や失敗を見て「飯がうまい」と喜ぶこと", "D.美味しいもの"], ans: "C", explain: "「他人の不幸で飯が美味い」の略称。他人の不幸や失敗を見て、喜びや痛快さを感じることを表す。"},
{q: "第47問", difficulty: "hard", choices: ["「ちな」とはどういう意味？", "A.血なまぐさい", "B.知らなーい", "C.ちなみに", "D.小さいな"], ans: "C", explain: "接続詞「ちなみに」を短縮したネットスラング。補足情報を付け加える際などに使われる。"},
{q: "第48問", difficulty: "hard", choices: ["「詰んだ」とはどういう状態？", "A.荷物を積むこと", "B.どうにもならない状態", "C.チェスで勝つこと", "D.車に積むこと"], ans: "B", explain: "将棋の「詰み」に由来し、打開策がなく、どうにもならない絶望的な状態を表すネットスラング。"},
{q: "第49問", difficulty: "hard", choices: ["ネットスラングで「釣り」とは？", "A.魚を釣ること", "B.人をだます嘘や挑発的な書き込みで反応を楽しむこと", "C.川に行くこと", "D.人を叩くこと"], ans: "B", explain: "他人の反応を引き出すことを目的に、意図的に嘘や挑発的な内容を投稿する行為。魚を釣るように相手を誘い出すことにたとえた表現。"},
{q: "第50問", difficulty: "hard", choices: ["ネットで「逝く」と書く場合、どのような意味で使われる？", "A.死ぬ、あるいは限界を迎える", "B.旅行に行く", "C.学校に行く", "D.病院に行く"], ans: "A", explain: "「行く」と同音の「逝く」という漢字を当てた表現で、死ぬことを直接的・比喩的に表したり、ゲームなどで限界を迎えることを意味したりする。"},
{q: "第51問", difficulty: "hard", choices: ["ネットスラングで「地雷」とは、主にどのようなものを指す？", "A.爆弾", "B.関わると問題が起こりそうな人や、避けたい要素", "C.地面の雷", "D.爆発すること"], ans: "B", explain: "関わるとトラブルが発生したり、不快感を覚えたりする可能性が高い人物や、避けたい作品設定・シチュエーションなどを指す比喩表現。"},
{q: "第52問", difficulty: "hard", choices: ["ネットスラングで「コピペ」の元となったパソコン操作の組み合わせは？", "A.コピー＆ペースト", "B.コントロール＆プリント", "C.コード＆プログラム", "D.コミック＆ページ"], ans: "A", explain: "文章やデータを「コピー」して「ペースト」するパソコン操作を略した言葉。ネット上では、転載された定番文章そのものを「コピペ」と呼ぶこともある。"},
{q: "第53問", difficulty: "hard", choices: ["「ggrks」という略称のネットスラングの意味は？", "A.「自分で検索して調べてください」という意味", "B.ガラガラ声", "C.グレートなカス", "D.ぐらぐらする"], ans: "A", explain: "「ググれカス」のローマ字表記「gugure kasu」の頭文字などを取ったネットスラングで、人に聞く前に自分で検索して調べるよう促す表現。"},
{q: "第54問", difficulty: "hard", choices: ["動画共有サイトなどで投稿者のことを指す「うp主」の読み方は？", "A.うぷぬし", "B.あっぷぬし", "C.うーぴーぬし", "D.ゆーぴーぬし"], ans: "A", explain: "「アップロード」を意味する「うp（うぷ）」と「主（ぬし）」を組み合わせた言葉で、「うぷぬし」と読む。"},
{q: "第55問", difficulty: "hard", choices: ["ネット掲示板で一人で複数のアカウントを使い、自作自演することを何と呼ぶ？", "A.自演", "B.自走", "C.自爆", "D.自重"], ans: "A", explain: "「自作自演」の略。自分で複数の立場を演じたり、賛同するコメントを投稿したりして、他人を装う行為を指す。"},
{q: "第56問", difficulty: "hard", choices: ["ネット掲示板の書き込みをジャンル別にまとめて閲覧しやすくしたブログサイトの総称は？", "A.まとめサイト", "B.パクリサイト", "C.コピペブログ", "D.ログサイト"], ans: "A", explain: "ネット掲示板などの書き込みを抽出・編集し、ジャンルや話題ごとにまとめて掲載するWebサイトの総称。"},
{q: "第57問", difficulty: "hard", choices: ["愛想がなく冷たい対応を指すネット発の俗称は？", "A.塩対応", "B.砂糖対応", "C.酢対応", "D.ショウユ対応"], ans: "A", explain: "相手に対するそっけなく冷たい対応を、塩味にたとえた表現。アイドルなどのファン対応を表す言葉としても広まった。"},
{q: "第58問", difficulty: "hard", choices: ["ネット上で公開情報から個人の身元や住所などを特定しようとする人々の通称は？", "A.特定班", "B.探偵団", "C.検索隊", "D.追跡組"], ans: "A", explain: "SNSなどで公開された写真や投稿などの情報を手掛かりに、人物や場所などを特定しようとするユーザーたちを指す通称。"},
{q: "第59問", difficulty: "hard", choices: ["相手の投稿に対してピントのずれた言動や失礼な返信を送る行為を何と呼ぶ？", "A.クソリプ", "B.ダメリプ", "C.ムダリプ", "D.オワリプ"], ans: "A", explain: "「クソなリプライ」の略。投稿の内容や文脈にそぐわない返信や、相手を不快にさせるような返信を指す。"},
{q: "第60問", difficulty: "hard", choices: ["特定のキャラやグループ全体を等しく推す行為を何という？", "A.箱推し", "B.全推し", "C.丸推し", "D.組推し"], ans: "A", explain: "グループや作品全体を「箱」に見立て、その中の特定の一人だけではなく、グループ全体を応援することを意味するオタク用語。"},
{q: "第61問", difficulty: "veryhard", choices: ["「微レ存」の意味は？", "A.非常にレアな存在", "B.微妙にレベルが存在する", "C.ごくわずかながら存在する", "D.微妙にレアな存在"], ans: "C", explain: "「微粒子レベルで存在している」の略語で、可能性や存在する可能性が非常に低いものの、完全にゼロではない状態を表す。"},
{q: "第62問", difficulty: "veryhard", choices: ["ネットスラングの「了解道中膝栗毛」は、どのような意味で使われる？", "A.膝が痛い", "B.旅行に行く", "C.馬に乗る", "D.「了解」をネタ的に長くした表現"], ans: "D", explain: "「了解」に、十返舎一九の滑稽本『東海道中膝栗毛』を掛け合わせたネタ表現。「了解」をふざけた調子で伝える際などに使われる。"},
{q: "第63問", difficulty: "veryhard", choices: ["ネットスラングの「全裸待機」とは、どのような意味？", "A.何かを強く楽しみにして待つことを冗談で全裸に例えた表現", "B.本当に全裸で待つ文化", "C.服を脱ぐと電波がいいから", "D.夏場だから"], ans: "A", explain: "楽しみにしている出来事を、服を脱いで待機するほど待ちわびているかのように大げさに表現したネットスラング。実際に全裸になるという意味ではない。"},
{q: "第64問", difficulty: "veryhard", choices: ["ネットスラングで『界隈』という言葉が使われるとき、主に何を指す？", "A.国の境界線", "B.学校の区画", "C.ネットの海域", "D.特定のコミュニティやファン層"], ans: "D", explain: "共通の趣味や関心、属性などを持つ人々が集まるコミュニティや、その周辺の人々・文化を指す言葉。ネットやファン文化などで広く使われる。"},
{q: "第65問", difficulty: "veryhard", choices: ["「虹裏」と呼ばれることがある掲示板は？", "A.2ちゃんねる", "B.5ちゃんねる", "C.Twitter", "D.ふたば☆ちゃんねる"], ans: "D", explain: "「虹裏」は、画像掲示板「ふたば☆ちゃんねる」にある「二次元裏」系の板を指す俗称。独特のネット文化やAA・コラージュなどで知られている。"},
{q: "第66問", difficulty: "veryhard", choices: ["「DKT」というネットスラングの意味として知られているのは？", "A.大公開", "B.大規模な交通障害", "C.大金", "D.大凶"], ans: "B", explain: "「大規模交通障害」の頭文字などを取った略語として使われたネットスラング。交通機関などで大規模な障害が発生した状況を指す。"},
{q: "第67問", difficulty: "veryhard", choices: ["ネットスラングで「リーマン」と書かれた場合、一般的に何を指す？", "A.サラリーマン", "B.数学者リーマン", "C.レイマン", "D.ただの誤字"], ans: "A", explain: "「サラリーマン」を短縮した俗称。ネット掲示板などで会社員を指す際に使われることがある。"},
{q: "第68問", difficulty: "veryhard", choices: ["ひろゆき氏の名言とセットで語られるAAは？", "A.ギコ猫", "B.やる夫", "C.八頭身モナー", "D.クマー"], ans: "C", explain: "ひろゆき氏の「嘘を嘘と見抜ける人でないと難しい」という発言と、八頭身モナーのAAを組み合わせたネタが広く知られている。"},
{q: "第69問", difficulty: "veryhard", choices: ["ネットスラング「ステマ」の略称元の正しい言葉は？", "A.ステップマーケティング", "B.ストリートマーケティング", "C.スタイルマーケティング", "D.ステルスマーケティング"], ans: "D", explain: "「ステルスマーケティング」の略。広告や宣伝であることを隠し、第三者による自然な口コミや評価であるかのように見せる宣伝手法を指す。"},
{q: "第70問", difficulty: "veryhard", choices: ["ネット掲示板でスレッドへの書き込みが規定の上限に達し、これ以上書き込めない状態を表す表現は？", "A.1000レス", "B.完走", "C.満員電車", "D.ストップ"], ans: "A", explain: "かつての2ちゃんねるでは、スレッドへの書き込みが1000件に達すると、それ以上書き込めなくなる仕様があり、「1000レス到達」などと表現された。"},
{q: "第71問", difficulty: "veryhard", choices: ["「半年ROMれ」というフレーズが生まれた背景として正しいのは？", "A.新参者が空気やローカルルールを読まずに発言・騒ぐのを咎めるため", "B.CD-ROMの読み込み速度が遅かったから", "C.半年ごとにROM交換が必要だったから", "D.半年ログインしないと消える仕様だったから"], ans: "A", explain: "ネット掲示板の初心者に対し、すぐに書き込まず、しばらく他の利用者の発言やローカルルールを見て雰囲気を学ぶよう促す言葉。"},
{q: "第72問", difficulty: "veryhard", choices: ["崩れた文体の元ネタとされる2ちゃんねるAAは？", "A.モナー", "B.ドクオ", "C.ショボーン", "D.内藤ホライゾン（ブーン）"], ans: "D", explain: "「内藤ホライゾン（ブーン）」は、走っているように見えるAA「ブーン」で知られるキャラクター。「〜お」などを特徴とする独特の文体とともにネット上で広まった。"},
{q: "第73問", difficulty: "veryhard", choices: ["ネットスラングで「自治厨」とはどのようなユーザー？", "A.地方自治体の公式アカウント運用者", "B.自慢話ばかり投稿する人", "C.自分のサイト管理者", "D.過剰にルールを掲げて他人を取り締まろうとする人"], ans: "D", explain: "掲示板やコミュニティの管理者ではないにもかかわらず、過度にルールを持ち出して他人の投稿を規制・注意しようとするユーザーを指す。"},
{q: "第74問", difficulty: "veryhard", choices: ["「誰得」の対義語として使われるネットスラングは？", "A.俺得", "B.皆得", "C.神得", "D.君得"], ans: "A", explain: "「誰得」が「誰が得をするのか分からない」という意味なのに対し、「俺得」は「一般的な需要はなくても自分にとっては最高」という意味で使われる。"},
{q: "第75問", difficulty: "veryhard", choices: ["「ぬるぽ」という書き込みに対するお約束の返答は？", "A.ガッ", "B.ギコ", "C.プチ", "D.ツッ"], ans: "A", explain: "「ぬるぽ」と書き込まれた際に「ガッ」と返すのは、2ちゃんねるで広まった有名なネット上のお約束。"},
{q: "第76問", difficulty: "veryhard", choices: ["ネットスラング「香具師（やし）」の語源は？", "A.「ヤツ（奴）」の打ち間違い", "B.テキ屋の隠語", "C.ヤシの実", "D.妖しい人物から"], ans: "A", explain: "「奴（やつ）」を入力する際の誤変換などから「やし」という表記が生まれ、漢字変換で「香具師」となったものがネットスラングとして定着した。"},
{q: "第77問", difficulty: "veryhard", choices: ["荒らし行為への対処としてよく使われる言葉は？", "A.荒らしはスルーが基本", "B.目には目を", "C.火には火を", "D.叩いて伸ばせ"], ans: "A", explain: "荒らしは他の利用者の反応を引き出すことを目的とする場合があるため、反応せず無視する「スルー」が基本的な対処法とされる。"},
{q: "第78問", difficulty: "veryhard", choices: ["「VIPPER」とはどこの板のユーザー？", "A.VIPルーム板", "B.ビップ専用板", "C.VIPカー板", "D.ニュース速報(VIP)板"], ans: "D", explain: "「VIPPER」は、2ちゃんねるの「ニュース速報(VIP)板」に集まるユーザーを指す呼称として広まった。"},
{q: "第79問", difficulty: "veryhard", choices: ["ネットスラング「厨房」はどの言葉をもじった？", "A.中坊（中学生）", "B.厨房（調理場）", "C.中国の投稿者", "D.ちゅうぶらりん"], ans: "A", explain: "中学生を意味する「中坊（ちゅうぼう）」を、同音の「厨房」に置き換えたネットスラング。ネット上では、未熟な言動をする人物を指す蔑称として使われることがある。"},
{q: "第80問", difficulty: "veryhard", choices: ["ネットスラングで「自重しろ」と言う場合、「自重」は一般に何と読む？", "A.じちょう", "B.じじゅう", "C.じょ", "D.じょう"], ans: "A", explain: "この場合の「自重」は「じちょう」と読み、自分の言動を慎む・控えるという意味で使われる。「自重しろ」は、行き過ぎた言動を控えるよう求める表現。"}
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

; 10問分を抽出
tf.selected_questions = tf.filtered.slice(0, tf.question_count);

tf.current_index = 0;
tf.score = 0;

; 設定値初期化（★ BGMをネットスラングジャンル用へ変更）
if(tf.diff == "easy"){
    tf.max_life = 5;
    tf.life = 5;
    tf.time_limit = 30;
    tf.hint_count = 4;
    tf.current_bg = 'haikei/easy_haikei.png';
    tf.current_bgm = 'netslang_easy.ogg';
} else if(tf.diff == "normal"){
    tf.max_life = 4;
    tf.life = 4;
    tf.time_limit = 25;
    tf.hint_count = 3;
    tf.current_bg = 'haikei/normal_haikei.png';
    tf.current_bgm = 'netslang_normal.ogg';
} else if(tf.diff == "hard"){
    tf.max_life = 3;
    tf.life = 3;
    tf.time_limit = 20;
    tf.hint_count = 2;
    tf.current_bg = 'haikei/hard_haikei.png';
    tf.current_bgm = 'netslang_hard.ogg';
} else if(tf.diff == "veryhard"){
    tf.max_life = 2;
    tf.life = 2;
    tf.time_limit = 15;
    tf.hint_count = 1;
    tf.current_bg = 'haikei/very_hard_haikei.png';
    tf.current_bgm = 'netslang_very_hard.ogg';
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

// チュートリアル用ボイス
f.tut_v1   = "voice/" + sf.selected_chara + "/tutorial_voice1.ogg";
f.tut_v2   = "voice/" + sf.selected_chara + "/tutorial_voice2.ogg";
f.tut_v3   = "voice/" + sf.selected_chara + "/tutorial_voice3.ogg";
f.tut_v4   = "voice/" + sf.selected_chara + "/tutorial_voice4.ogg";
f.tut_v5   = "voice/" + sf.selected_chara + "/tutorial_voice5.ogg";
f.tut_v6   = "voice/" + sf.selected_chara + "/tutorial_voice6.ogg";
f.tut_v7   = "voice/" + sf.selected_chara + "/tutorial_voice7.ogg";
f.tut_v8   = "voice/" + sf.selected_chara + "/tutorial_voice8.ogg";
f.tut_v9   = "voice/" + sf.selected_chara + "/tutorial_voice9.ogg";
f.tut_v10  = "voice/" + sf.selected_chara + "/tutorial_voice10.ogg";
f.tut_v11  = "voice/" + sf.selected_chara + "/tutorial_voice11.ogg";
f.tut_v12  = "voice/" + sf.selected_chara + "/tutorial_voice12.ogg";
f.tut_v13  = "voice/" + sf.selected_chara + "/tutorial_voice13.ogg";
f.tut_v14  = "voice/" + sf.selected_chara + "/tutorial_voice14.ogg";
f.tut_v15  = "voice/" + sf.selected_chara + "/tutorial_voice15.ogg";
f.tut_v16  = "voice/" + sf.selected_chara + "/tutorial_voice16.ogg";
f.tut_v17  = "voice/" + sf.selected_chara + "/tutorial_voice17.ogg";
f.tut_v18  = "voice/" + sf.selected_chara + "/tutorial_voice18.ogg";
f.tut_v19  = "voice/" + sf.selected_chara + "/tutorial_voice19.ogg";
f.tut_v20  = "voice/" + sf.selected_chara + "/tutorial_voice20.ogg";
f.tut_v21  = "voice/" + sf.selected_chara + "/tutorial_voice21.ogg";
f.tut_v22  = "voice/" + sf.selected_chara + "/tutorial_voice22.ogg";

// ウェルカム演出用ボイス
f.wel_v1     = "voice/" + sf.selected_chara + "/welcome_voice1.ogg";
f.wel_v_diff = "voice/" + sf.selected_chara + "/diff_" + tf.diff + ".ogg";
f.wel_v2     = "voice/" + sf.selected_chara + "/welcome_voice2.ogg";
f.wel_v3     = "voice/" + sf.selected_chara + "/welcome_voice3.ogg";
f.wel_v4     = "voice/" + sf.selected_chara + "/welcome_voice4.ogg";
f.wel_v5     = "voice/" + sf.selected_chara + "/welcome_voice5.ogg";
[endscript]


; --- 初回判定 ＆ 演出分岐 ---

; EASY 以外の難易度はチュートリアル判定をスキップして強制的にウェルカム演出へ
[jump cond="tf.diff != 'easy'" target="*welcome_scene" storage=""]

; EASY の場合のみチュートリアル判定を行う
[jump cond="!sf.tutorial_seen" target="*tutorial_scene" storage=""]
[dialog type="confirm" text="チュートリアルを再生しますか？" target="*tutorial_scene" target_cancel="*welcome_scene" label_ok="はい" label_cancel="いいえ"]

[s]


; --- 3. チュートリアル分岐 ---

*tutorial_scene

[iscript]
// 選択キャラを取得（初期値は onp）
var chara = sf.selected_chara || 'onp';
var num = 1;

if (chara === 'onp') {
    num = 1; // １人目
} else if (chara === 'quiz') {
    num = 2; // ２人目
} else if (chara === 'tukuyomi') {
    num = 3; // ３人目
} else if (chara === 'ameno') {
    num = 4; // ４人目
} else if (chara === 'zunda') {
    num = 5; // 隠しキャラ
}

tf.tut_file = "tutorial_serihu" + num + ".ks";

// ★ クイズプレイ時（画面右側表示）のキャラクター別サイズ・座標を定義
if (sf.selected_chara == "onp") {
    f.q_x = "750"; f.q_y = "120"; f.q_w = "100";
} else if (sf.selected_chara == "quiz") {
    f.q_x = "830"; f.q_y = "180"; f.q_w = "400";
} else if (sf.selected_chara == "tukuyomi") {
    f.q_x = "800"; f.q_y = "160"; f.q_w = "450";
} else if (sf.selected_chara == "ameno") {
    f.q_x = "730"; f.q_y = "130"; f.q_w = "550";
} else if (sf.selected_chara == "zunda") {
    f.q_x = "830"; f.q_y = "150"; f.q_w = "500";
}
[endscript]

; キャラごとのチュートリアルファイルへジャンプ
[jump storage="&tf.tut_file" target="*start"]


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

// 制限時間のミリ秒計算（例: 15秒なら 15000ms）
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

// ★ 走っているタイマーがあれば破棄し、新規でカウントダウンを設定
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
// ★ 回答ボタン押下時にタイマーを完全クリア
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

; 次の問題へ進む直前に立ち絵を消去
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

[jump target="*redraw_choices" storage=""]


; ========================================
; ★ 選択肢再描画用ラベル
; ========================================
*redraw_choices

[cm]

[glink color="black" target="*check_answer" text="&tf.shuffled[0]" size="20" x="250" y="300" width="250" exp="tf.choice_num=0" cond="tf.show0"]
[glink color="black" target="*check_answer" text="&tf.shuffled[1]" size="20" x="680" y="300" width="250" exp="tf.choice_num=1" cond="tf.show1"]
[glink color="black" target="*check_answer" text="&tf.shuffled[2]" size="20" x="250" y="420" width="250" exp="tf.choice_num=2" cond="tf.show2"]
[glink color="black" target="*check_answer" text="&tf.shuffled[3]" size="20" x="680" y="420" width="250" exp="tf.choice_num=3" cond="tf.show3"]

[free layer="2" name="hint_btn"]
[button storage="" target="*use_hint" graphic="button/button1.png" enterimg="button/button01.png" x="1000" y="600" name="hint_btn"]

[jump target="*show_choices" storage=""]


; --- 時間切れ処理 ---

*time_up

[cm]
[stopse]
[playse storage="se/time_up.ogg"]

[iscript]
// ★ 時間切れ時もタイマーを完全クリア
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


; --- ゲーム終了処理（★ ネットスラングジャンル仕様） ---

*quiz_end

[cm]
[tb_show_message_window]

貴方は[emb exp="tf.question_count"]点中[emb exp="tf.score"]点です！[p]

[iscript]
tf.current_genre = 'netslang';

var key_normal   = tf.current_genre + '_normal';
var key_hard     = tf.current_genre + '_hard';
var key_veryhard = tf.current_genre + '_veryhard';

tf.show_dialog = false;
tf.alert_msg   = "";

if (tf.diff === 'easy' && !sf[key_normal]) {
    sf.netslang_easy  = true;
    sf[key_normal]    = true;
    sf.unlock_genre   = true;
    tf.show_dialog    = true;
    tf.alert_msg      = "ネットスラングの難易度 NORMAL が解放されました！";
}

if (tf.diff === 'normal' && tf.score >= 8 && !sf[key_hard]) {
    sf[key_hard]    = true;
    tf.show_dialog  = true;
    tf.alert_msg    = "8問以上正解！ネットスラングの難易度 HARD が解放されました！";
}

if (tf.diff === 'hard' && tf.score >= 8 && tf.life == tf.max_life && !sf[key_veryhard]) {
    sf[key_veryhard]   = true;
    tf.show_dialog     = true;
    tf.alert_msg       = "ノーダメージクリア！ネットスラングの最高難易度 VERY HARD が解放されました！";
}
[endscript]

[dialog type="alert" text="&tf.alert_msg" cond="tf.show_dialog == true"]

[tb_hide_message_window]
[freeimage layer="2"]
[freeimage layer="1"]

[jump storage="title_screen.ks" target="*game_end"]
