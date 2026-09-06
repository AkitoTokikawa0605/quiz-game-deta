[_tb_system_call storage=system/_quiz_game.ks]


; --- 1. 難易度選択 ---

*difficulty_select

[hidemenubutton]

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
tf.current_genre = tf.current_genre || 'game';

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
{q: "第1問", difficulty: "easy", choices: ["『スーパーマリオブラザーズ』で、<br>マリオの双子の弟の名前は？", "A.ルイージ", "B.ワリオ", "C.ワルイージ", "D.ヨッシー"], ans: "A", explain: "ルイージはマリオの双子の弟。緑の帽子とシャツ、青いオーバーオールがトレードマークで、マリオより背が高く、ジャンプ力が高いという特徴を持つ。"},
{q: "第2問", difficulty: "easy", choices: ["『ポケットモンスター』シリーズで、ピカチュウが進化すると何になる？", "A.ライチュウ", "B.ピチュー", "C.プラスル", "D.マイナン"], ans: "A", explain: "ピカチュウに「かみなりのいし」を使用することで、より体が大きく、電気袋が発達したねずみポケモンのライチュウへ進化する。"},
{q: "第3問", difficulty: "easy", choices: ["『星のカービィ』シリーズで、カービィの代表的な<br>能力といえば？", "A.敵を吸い込んでコピーする", "B.剣を振るう", "C.火を吹く", "D.魔法を使う"], ans: "A", explain: "カービィは大きな口で敵を吸い込み、飲み込むことで、その敵が持つ固有の技や姿に変身する「コピー能力」を持っている。"},
{q: "第4問", difficulty: "easy", choices: ["『ソニック・ザ・ヘッジホッグ』の主人公ソニックの色は？", "A.赤", "B.青", "C.黄色", "D.緑"], ans: "B", explain: "ソニック・ザ・ヘッジホッグは音速で走ることができる青いハリネズミ。鮮やかな青い体色がキャラクターの特徴。"},
{q: "第5問", difficulty: "easy", choices: ["『パックマン』のゲーム画面に登場する敵（ゴースト）の<br>数は基本何匹？", "A.1匹", "B.2匹", "C.4匹", "D.8匹"], ans: "C", explain: "パックマンを追いかけるモンスター（ゴースト）は、赤・ピンク・水色・オレンジの4種類で、それぞれ固有の行動パターンを持つ。"},
{q: "第6問", difficulty: "easy", choices: ["『あつまれ どうぶつの森』で、無人島生活のサポートをしてくれるタヌキは？", "A.まめきち", "B.つぶきち", "C.ケント", "D.たぬきち"], ans: "D", explain: "たぬき開発の社長「たぬきち」は、無人島移住パッケージを案内し、家づくりやインフラ整備など、島での生活を幅広くサポートする。"},
{q: "第7問", difficulty: "easy", choices: ["『フォートナイト』で代表的なゲームモードのジャンルは？", "A.バトルロイヤル", "B.シミュレーション", "C.恋愛アドベンチャー", "D.パズル"], ans: "A", explain: "フォートナイトの代表的なゲームモードは、最大100人が島に降り立ち、建築と戦闘を駆使して最後の1人（または1組）になるまで戦うバトルロイヤル。"},
{q: "第8問", difficulty: "easy", choices: ["『マリオカート』シリーズで、1位のプレイヤーを追尾して攻撃するアイテムは？", "A.赤こうら", "B.緑こうら", "C.トゲゾーこうら", "D.バナナ"], ans: "C", explain: "トゲゾーこうらは自動追尾型のアイテムで、コース上を飛びながら現在1位のプレイヤーを狙って攻撃する特徴を持つ。"},
{q: "第9問", difficulty: "easy", choices: ["『太鼓の達人』のゲームジャンルは？", "A.リズムゲーム", "B.アクション", "C.シューティング", "D.格闘"], ans: "A", explain: "太鼓の達人は、流れてくる音符に合わせて太鼓を叩き、演奏を楽しむ和風リズムゲーム。"},
{q: "第10問", difficulty: "easy", choices: ["『テトリス』で、ブロックを横一列にそろえるとどうなる？", "A.ブロックを積み上げる", "B.ブロックを消す", "C.ブロックを壊す", "D.ブロックを飛ばす"], ans: "B", explain: "テトリミノを横一列に隙間なくそろえると、その列が消えて得点が入る仕組み。"},
{q: "第11問", difficulty: "easy", choices: ["『トゥームレイダー』の主人公といえば？", "A.ララ・クロフト", "B.エリス", "C.ジル", "D.クレア"], ans: "A", explain: "ララ・クロフトは世界中の遺跡を巡るイギリス出身の女性考古学者で、シリーズを代表する冒険家。"},
{q: "第12問", difficulty: "easy", choices: ["『クラッシュ・バンディクー』の主人公は何の動物？", "A.キツネ", "B.タヌキ", "C.バンディクー", "D.サル"], ans: "C", explain: "クラッシュは有袋類の動物「バンディクー」をベースに改造されたキャラクターで、シリーズの主人公。"},
{q: "第13問", difficulty: "easy", choices: ["『ドラゴンクエスト』シリーズでおなじみの、<br>スライムの代表的な体の色は何色？", "A.赤", "B.青", "C.緑", "D.黄色"], ans: "B", explain: "スライムは青い体色の基本種が代表的で、シリーズの看板モンスターとして親しまれている。"},
{q: "第14問", difficulty: "easy", choices: ["『ストリートファイター』シリーズの主人公「リュウ」が<br>放つ代表的な必殺技は？", "A.かめはめ波", "B.霊丸", "C.波動拳", "D.スパイラルアロー"], ans: "C", explain: "波動拳は気を前方へ放つ必殺技で、格闘ゲームを象徴する技として世界中で知られている。"},
{q: "第15問", difficulty: "easy", choices: ["『ぷよぷよ』で、消すために同じ色のぷよを最低何個<br>つなげる必要がある？", "A.2個", "B.3個", "C.4個", "D.5個"], ans: "C", explain: "同色のぷよを4個以上つなげると消滅し、連鎖を作ることで相手におじゃまぷよを送れる。"},
{q: "第16問", difficulty: "easy", choices: ["『大乱闘スマッシュブラザーズ』シリーズで、<br>相手を攻撃すると増えていく数値は？", "A.HP", "B.MP", "C.スタミナ", "D.蓄積ダメージ（％）"], ans: "D", explain: "蓄積ダメージ（％）が高くなるほど、攻撃を受けた際に吹っ飛びやすくなる。"},
{q: "第17問", difficulty: "easy", choices: ["『ゼルダの伝説』シリーズで、緑の服を着て剣を振るう<br>主人公の名前は？", "A.ガノンドロフ", "B.リンク", "C.ゼルダ", "D.エポナ"], ans: "B", explain: "リンクは緑のチュニックをまとい、マスターソードを手に冒険するシリーズの主人公。"},
{q: "第18問", difficulty: "easy", choices: ["『スイカゲーム』で、果物を進化させて最終的に目指す<br>一番大きな果物は？", "A.メロン", "B.パイナップル", "C.カボチャ", "D.スイカ"], ans: "D", explain: "同じ果物を合体させて進化させ、最終的に最大サイズの「スイカ」を作ることを目指すパズルゲーム。"},
{q: "第19問", difficulty: "easy", choices: ["『Apex Legends』で、1チーム（スクワッド）の<br>標準的な基本人数は何人？", "A.2人", "B.3人", "C.4人", "D.5人"], ans: "B", explain: "Apexの基本編成は3人1組（トリオ）で、レジェンドの能力を組み合わせて戦う。"},
{q: "第20問", difficulty: "easy", choices: ["『Minecraft（マインクラフト）』で、地面などに<br>多く存在する基本的なブロックは？", "A.土", "B.ダイヤモンド", "C.黒曜石", "D.鉄"], ans: "A", explain: "土ブロックはマインクラフトの世界の地表に広範囲で生成されている、最も基本的かつ大量に手に入るブロックの一つ。"},
{q: "第21問", difficulty: "normal", choices: ["『逆転裁判』シリーズで、主人公が証言の矛盾を指摘する<br>時の決め台詞は？", "A.くらえ！", "B.待った！", "C.異議あり！", "D.見つけた！"], ans: "C", explain: "「異議あり！」は、弁護士である主人公たちが法廷で相手の発言の矛盾を突く際や、証拠品を提示する際に放つ、シリーズを象徴する決め台詞。"},
{q: "第22問", difficulty: "normal", choices: ["『スプラトゥーン』シリーズの「ナワバリバトル」で、<br>インクを塗る主な目的は？", "A.敵を倒すため", "B.服を汚すため", "C.お金を稼ぐため", "D.ナワバリを広げるため"], ans: "D", explain: "ナワバリバトルは3分間の制限時間内に、ステージの地面にどれだけ自分のチームのインクを塗り拡げられたかを競う基本ルール。"},
{q: "第23問", difficulty: "normal", choices: ["『Among Us』で、クルーがゲーム中に正体を<br>見破るべき敵は？", "A.王様", "B.インポスター（詐欺師）", "C.医者", "D.警察"], ans: "B", explain: "インポスターは宇宙船の乗組員（クルー）に紛れ込んだ裏切り者。正体を隠しながらタスクの妨害やクルーの殺害を狙う。"},
{q: "第24問", difficulty: "normal", choices: ["『原神』の冒険の舞台となる世界の名前は？", "A.テイワット", "B.セレスティア", "C.稲妻", "D.モンド"], ans: "A", explain: "テイワットは7つの元素が巡る幻想世界。プレイヤーは離れ離れになった双子の片割れを探すため、テイワットの各地を旅する。"},
{q: "第25問", difficulty: "normal", choices: ["『ペルソナ5』の主人公が怪盗団として活動する際の<br>コードネームは？", "A.スカル", "B.パンサー", "C.ジョーカー", "D.クイーン"], ans: "C", explain: "主人公は「心の怪盗団」のリーダーであり、切り札や万能を意味する「ジョーカー」のコードネームで呼ばれている。"},
{q: "第26問", difficulty: "normal", choices: ["『God of War』シリーズの主人公、スパルタの亡霊と<br>呼ばれる男は？", "A.アトレウス", "B.オーディン", "C.クレイトス", "D.ゼウス"], ans: "C", explain: "クレイトスはスパルタ出身の戦士で、神々との因縁を抱えながら壮絶な戦いを繰り広げる、「スパルタの亡霊」と呼ばれる存在。"},
{q: "第27問", difficulty: "normal", choices: ["『モンスターハンター』シリーズを代表する<br>飛竜種のモンスターは？", "A.ティガレックス", "B.ナルガクルガ", "C.ラージャン", "D.リオレウス"], ans: "D", explain: "リオレウスは優れた飛行能力と火炎ブレスを持つ大型飛竜で、シリーズを象徴する「空の王者」として登場する。"},
{q: "第28問", difficulty: "normal", choices: ["『Fallout』シリーズの舞台は、どんな世界？", "A.魔法世界", "B.核戦争後の荒廃した世界", "C.未来の宇宙都市", "D.中世ヨーロッパ"], ans: "B", explain: "Falloutシリーズは核戦争後の荒廃したアメリカを舞台にした作品で、レトロフューチャーな世界観が特徴。"},
{q: "第29問", difficulty: "normal", choices: ["『龍が如く』シリーズの主人公、桐生一馬の異名は？", "A.新宿の虎", "B.神室町の狼", "C.堂島の龍", "D.大阪の鷹"], ans: "C", explain: "桐生一馬は堂島組に所属していた過去を持ち、圧倒的な強さと龍の刺青から「堂島の龍」と呼ばれている。"},
{q: "第30問", difficulty: "normal", choices: ["『ストリートファイターII』で、ガイルの出身国は？", "A.日本", "B.アメリカ", "C.イギリス", "D.フランス"], ans: "B", explain: "ガイルはアメリカ空軍の少佐。角刈りのような金髪と軍服風の衣装が特徴で、親友の敵であるベガを追っている。"},
{q: "第31問", difficulty: "normal", choices: ["『桃太郎電鉄』シリーズで、プレイヤーが物件を購入して<br>増やしていくものは？", "A.仲間", "B.体力", "C.経験値", "D.資産（総資産）"], ans: "D", explain: "桃太郎電鉄は日本全国を巡り、物件を買収して収益を得ながら、総資産日本一を目指すスゴロクゲーム。"},
{q: "第32問", difficulty: "normal", choices: ["『リーグ・オブ・レジェンド』で知られる<br>ゲームジャンルは？", "A.FPS", "B.TPS", "C.MOBA", "D.MMORPG"], ans: "C", explain: "LoLはMOBA（マルチプレイヤーオンラインバトルアリーナ）を代表するタイトルで、敵陣地の破壊を目指すチーム戦が特徴。"},
{q: "第33問", difficulty: "normal", choices: ["『モンスターハンター』シリーズで、肉を上手に焼いたときに手に入るスタミナ回復アイテムは？", "A.生肉", "B.生焼け肉", "C.コゲ肉", "D.こんがり肉"], ans: "D", explain: "音楽に合わせて肉を焼くと「こんがり肉」が完成し、スタミナ上限を大きく回復できる。"},
{q: "第34問", difficulty: "normal", choices: ["『ファイナルファンタジー』シリーズで、鳥のような<br>見た目で移動手段としておなじみの乗り物は？", "A.モーグリ", "B.チョコボ", "C.サボテンダー", "D.トンベリ"], ans: "B", explain: "チョコボは黄色い鳥のような生物で、背中に乗ってフィールドを高速移動できる。"},
{q: "第35問", difficulty: "normal", choices: ["『ウマ娘 プリティーダービー』で、<br>プレイヤーの役職（立場）は何？", "A.プロデューサー", "B.監督", "C.マスター", "D.トレーナー"], ans: "D", explain: "プレイヤーはトレセン学園のトレーナーとしてウマ娘を育成し、レースでの勝利を目指す。"},
{q: "第36問", difficulty: "normal", choices: ["『ブルーアーカイブ』の舞台となる、数千の学園が集まる<br>超巨大学園都市の名前は？", "A.キヴォトス", "B.学園都市", "C.ミレニアム", "D.トリニティ"], ans: "A", explain: "キヴォトスは数千もの独立した学園から構成されている超巨大都市。プレイヤーは「先生」となり、生徒たちとともに都市のトラブルを解決する。"},
{q: "第37問", difficulty: "normal", choices: ["『プロジェクトセカイ カラフルステージ！ feat. 初音ミク』で、各ユニットの想いから生まれる不思議な世界の名称は？", "A.アナザーワールド", "B.ステージ", "C.シンカ", "D.セカイ"], ans: "D", explain: "「セカイ」は人々の本当の想いから生み出された空間。バーチャル・シンガーたちがその世界に存在し、少年少女の本当の想いを見つける手助けをする。"},
{q: "第38問", difficulty: "normal", choices: ["『Fate/Grand Order』で、プレイヤーがサーヴァントを<br>召喚・指揮する立場（肩書）は何？", "A.マスター", "B.プロデューサー", "C.ドクター", "D.指揮官"], ans: "A", explain: "主人公はカルデアに所属する最後の「マスター」として、英霊（サーヴァント）と契約し、指揮を行う。"},
{q: "第39問", difficulty: "normal", choices: ["『グランブルーファンタジー』で、主人公とともに旅をする小さな赤い竜の名前は？", "A.ルリア", "B.カタリナ", "C.ビィ", "D.ラカム"], ans: "C", explain: "ビィは主人公の相棒である赤い小さな竜。リンゴが大好物で、冒険のマスコット的存在。"},
{q: "第40問", difficulty: "normal", choices: ["『ゼルダの伝説』シリーズで、ゼルダ姫が治める王国として知られるのは？", "A.ガノン", "B.コキリ", "C.スカイロフト", "D.ハイラル"], ans: "D", explain: "ハイラル王国は『ゼルダの伝説』シリーズの主な舞台となる王国。ゼルダ姫の一族であるハイラル王家が代々治めている。"},
{q: "第41問", difficulty: "hard", choices: ["『メタルギアソリッド』の主人公ソリッド・スネークの<br>生みの親とも言えるゲームクリエイターは？", "A.坂口博信", "B.小島秀夫", "C.宮本茂", "D.桜井政博"], ans: "B", explain: "小島秀夫は『メタルギア』シリーズを手掛けたゲームクリエイター。ステルスアクションというジャンルを世界的に広めた人物の一人として知られている。"},
{q: "第42問", difficulty: "hard", choices: ["『ファイナルファンタジーVII』の主人公クラウドが<br>装備している巨大な剣の名前は？", "A.ガンブレード", "B.バスターソード", "C.エクスカリバー", "D.正宗"], ans: "B", explain: "バスターソードは身の丈ほどもある大剣で、クラウドを象徴する武器。クラウドが使用するほか、親友ザックスから受け継いだものとしても描かれている。"},
{q: "第43問", difficulty: "hard", choices: ["『ストリートファイター』シリーズで、リュウとケンの<br>師匠の名前は？", "A.豪鬼", "B.ベガ", "C.剛拳", "D.サガット"], ans: "C", explain: "剛拳（ごうけん）はリュウとケンの師匠で、2人に格闘技や波動の力について教えた人物。豪鬼の実兄でもある。"},
{q: "第44問", difficulty: "hard", choices: ["『バイオハザード』シリーズに登場する、物語の元凶とも<br>いえる製薬会社は？", "A.アークレイ社", "B.ラクーン社", "C.U.B.S社", "D.アンブレラ社"], ans: "D", explain: "アンブレラ社は表向きは巨大製薬企業だが、裏ではウイルスや生体兵器の研究・開発を行っていた、シリーズを通して重要な組織。"},
{q: "第45問", difficulty: "hard", choices: ["『デビルメイクライ』シリーズの主人公ダンテの<br>兄の名前は？", "A.バージル", "B.ネロ", "C.スパーダ", "D.トリッシュ"], ans: "A", explain: "バージルはダンテの双子の兄。父スパーダの力を受け継ぎ、強さを求める冷徹な剣士としてシリーズで重要な役割を果たす。"},
{q: "第46問", difficulty: "hard", choices: ["『ファイアーエムブレム 暗黒竜と光の剣』の主人公マルスの剣の名前は？", "A.ラグネル", "B.ティルヴィング", "C.聖剣エクスカリバー", "D.ファルシオン"], ans: "D", explain: "ファルシオンは神竜王ナーガの牙から作られた神剣で、マルスが暗黒竜メディウスに立ち向かうための重要な武器。"},
{q: "第47問", difficulty: "hard", choices: ["『キングダムハーツ』で、主人公ソラが持つ鍵のような<br>武器の名前は？", "A.ライトセーバー", "B.スターライト", "C.キーブレード", "D.ハートブレード"], ans: "C", explain: "キーブレードは鍵の形をした特殊な武器。ハートレスと戦ったり、世界の扉を開いたりする際に重要な役割を果たす。"},
{q: "第48問", difficulty: "hard", choices: ["『ゼノブレイド』で、シュルクが未来視（ビジョン）を<br>使えるようになる理由は？", "A.モナドに触れて力が<br>覚醒したため", "B.生まれつきの能力だから", "C.機神兵に改造されたため", "D.特別な訓練を受けたため"], ans: "A", explain: "シュルクは神剣モナドを扱うことで、これから起こる出来事を垣間見る「未来視（ビジョン）」の力を発現するようになる。"},
{q: "第49問", difficulty: "hard", choices: ["『ペルソナ3』で、ペルソナを召喚するために<br>使う銃のような道具は？", "A.起動銃", "B.ペルソナ銃", "C.召喚器（エボーカー）", "D.デビルバスター"], ans: "C", explain: "召喚器（エボーカー）は銃のような形をした特殊な器具で、使用者の精神に作用してペルソナを召喚するために使われる。"},
{q: "第50問", difficulty: "hard", choices: ["『地球防衛軍3』で初登場した敵はどれ？", "A.巨大生物（虫）", "B.エイリアン（コロニスト）", "C.巨大ロボット（ヘクトル）", "D.ドラゴン型の怪物"], ans: "C", explain: "ヘクトルは『地球防衛軍3』で初登場したフォーリナーの巨大二足歩行兵器。両腕に強力な武器を装備し、EDFを苦しめた。"},
{q: "第51問", difficulty: "hard", choices: ["『ロックマン』シリーズで、各ステージのボスとして<br>登場するロボットの総称は？", "A.ボスロボット", "B.ロボットマスター", "C.ワイリーナンバーズ", "D.イレギュラー"], ans: "B", explain: "ロボットマスターは『ロックマン』シリーズで各ステージのボスとして登場する特殊なロボットの総称。撃破すると、その特殊武器を使用できるようになる。"},
{q: "第52問", difficulty: "hard", choices: ["『Stardew Valley』で、町の復興のために修復を<br>目指す施設は？", "A.市役所", "B.公民館（Community Center）", "C.教会", "D.図書館"], ans: "B", explain: "公民館（Community Center）はペリカンタウンの中心にある施設。プレイヤーはさまざまなアイテムを納品して各部屋の修復を進めていく。"},
{q: "第53問", difficulty: "hard", choices: ["『ELDEN RING（エルデンリング）』で、プレイヤーである「褪せ人」を導く謎の少女の名前は？", "A.ラニ", "B.フィア", "C.メリナ", "D.レナラ"], ans: "C", explain: "メリナは褪せ人の前に現れる謎の少女。霊馬トレントを託し、ルーンを力に変える能力を与えるなど、主人公の旅を導く重要な存在。"},
{q: "第54問", difficulty: "hard", choices: ["『シャドウバース』で、自分のターン開始時に増えて<br>カードを使うために必要なポイントは？", "A.PP（プレイポイント）", "B.MP（マナポイント）", "C.AP（アクションポイント）", "D.コスト"], ans: "A", explain: "PP（プレイポイント）はカードをプレイするために必要なポイント。自分のターン開始時に回復し、ゲームの進行に応じて最大値が増えていく。"},
{q: "第55問", difficulty: "hard", choices: ["『東方Project』シリーズの第1作目のタイトルは？", "A.東方紅魔郷", "B.東方妖々夢", "C.東方靈異伝", "D.東方封魔録"], ans: "C", explain: "『東方靈異伝』は1996年にPC-98向けに発表された作品で、東方Projectの第1作目。後の弾幕シューティングとは異なり、ブロック崩しに近いシステムを採用している。"},
{q: "第56問", difficulty: "hard", choices: ["『ニーア レプリカント』で、主人公に同行する喋る<br>魔導書の名前は？", "A.黒の書", "B.白の書", "C.赤の書", "D.灰の書"], ans: "B", explain: "白の書は主人公に同行する魔導書で、尊大な口調で話す個性的な相棒。魔法を使うための力を主人公たちに提供する。"},
{q: "第57問", difficulty: "hard", choices: ["『ベヨネッタ』シリーズの主人公ベヨネッタの本来の<br>種族（魔女の一族）は？", "A.ルーメンの賢者", "B.ヴァルハラの魔女", "C.アルカナの魔女", "D.アンブラの魔女"], ans: "D", explain: "ベヨネッタは闇を司る魔女の一族「アンブラの魔女」の生き残り。悪魔と契約し、その力を駆使して戦う。"},
{q: "第58問", difficulty: "hard", choices: ["『DEATH STRANDING』の主人公サム・ポーター・<br>ブリッジズを演じた俳優は？", "A.マッツ・ミケルセン", "B.ギレルモ・デル・トロ", "C.レイ・ニコルソン", "D.ノーマン・リーダス"], ans: "D", explain: "サム・ポーター・ブリッジズを演じたのは俳優ノーマン・リーダス。本人の顔や身体を3Dスキャンしたキャラクターとして登場し、演技も担当している。"},
{q: "第59問", difficulty: "hard", choices: ["『Dead by Daylight』で、キラー（殺人鬼）から逃げ延びる人間側のプレイヤーの総称は？", "A.チェイサー", "B.サバイバー（生存者）", "C.ランナー", "D.エスケーパー"], ans: "B", explain: "サバイバーはキラーから逃げながら発電機を修理し、脱出を目指す人間側のプレイヤー。基本的に4人のサバイバーと1人のキラーで対戦する。"},
{q: "第60問", difficulty: "hard", choices: ["『Ghost of Tsushima（ゴースト・オブ・ツシマ）』の<br>主人公である武士の名前は？", "A.志村", "B.政子", "C.石川", "D.境井 仁"], ans: "D", explain: "境井仁は『Ghost of Tsushima』の主人公。蒙古軍の侵攻から故郷の対馬を守るため、武士としての道を越えた「冥人」として戦う。"},
{q: "第61問", difficulty: "veryhard", choices: ["『ドラゴンクエストV 天空の花嫁』で、主人公の父親であるパパスの最期に現れた魔族は？", "A.ブオーン", "B.ミルドラース", "C.ゲマ", "D.イブール"], ans: "C", explain: "ゲマは光の教団の幹部で、パパスの最期にも立ち会う。主人公一家に深い因縁を残す、物語を代表する敵キャラクター。"},
{q: "第62問", difficulty: "veryhard", choices: ["『Bloodborne』で、プレイヤーが経験値の代わりに集める<br>通貨の名前は？", "A.ソウル", "B.ルーン", "C.銭", "D.血の遺志"], ans: "D", explain: "「血の遺志」は敵を倒すなどして入手できる、本作における経験値と通貨を兼ねた要素。能力値の強化やアイテムの購入などに使用する。"},
{q: "第63問", difficulty: "veryhard", choices: ["『ニーア オートマタ』で、2Bや9Sが所属する<br>組織の名前は？", "A.特務機関NERV", "B.SEED", "C.神羅カンパニー", "D.YoRHa（ヨルハ）"], ans: "D", explain: "YoRHa（ヨルハ）は、機械生命体と戦うために組織されたアンドロイド部隊。主人公の2Bや9Sもヨルハ部隊に所属している。"},
{q: "第64問", difficulty: "veryhard", choices: ["『クロノ・トリガー』で、未来の時代に登場する<br>タイムマシンの日本語版での名前は？", "A.ラヴォス", "B.エポック", "C.シルバード", "D.ゲートキー"], ans: "C", explain: "「シルバード」は未来の時代で登場するタイムマシン。後に改造され、時空を自由に飛び回れる乗り物として活躍する。"},
{q: "第65問", difficulty: "veryhard", choices: ["『ダークソウル』シリーズで、太陽の戦士ソラールが<br>信仰しているものは？", "A.月", "B.闇", "C.火", "D.太陽"], ans: "D", explain: "ソラールは「太陽の戦士」を自称する騎士で、自らの「太陽」を探すために旅をしている。「太陽万歳！」のポーズでも有名。"},
{q: "第66問", difficulty: "veryhard", choices: ["『Undertale』のサンズ戦で、サンズがプレイヤーの攻撃を回避するのはなぜ？", "A.サンズが攻撃を回避する能力を持っているから", "B.彼が素早いから", "C.彼が魔法を使っているから", "D.彼が壁に隠れているから"], ans: "A", explain: "サンズは通常の戦闘ルールとは異なり、プレイヤーの攻撃を動いて回避する特殊な戦闘スタイルを持つ。作中でも非常に特殊なボスとして描かれている。"},
{q: "第67問", difficulty: "veryhard", choices: ["『サイレントヒル2』に登場する「三角頭」の英語名として知られているのは？", "A.Red Pyramid Thing", "B.Butcher", "C.Bubble Head Nurse", "D.Pyramid Head"], ans: "D", explain: "「Pyramid Head（ピラミッドヘッド）」は巨大な三角錐状の兜をかぶった怪物で、『サイレントヒル2』を象徴する存在として知られている。"},
{q: "第68問", difficulty: "veryhard", choices: ["『Half-Life』の主人公ゴードン・フリーマンが<br>象徴的に使用する武器は？", "A.ショットガン", "B.バール", "C.弓", "D.レーザーガン"], ans: "B", explain: "バールはゲーム序盤でゴードン・フリーマンが手にする近接武器で、シリーズを象徴するアイテムとして広く知られている。"},
{q: "第69問", difficulty: "veryhard", choices: ["『F-ZERO』シリーズの主人公キャプテン・ファルコンが<br>操縦するマシンの名前は？", "A.ファイアスティンガー", "B.ゴールデンフォックス", "C.ワイルドグース", "D.ブルーファルコン"], ans: "D", explain: "ブルーファルコンはキャプテン・ファルコンの愛機。青いボディが特徴的な高速マシンで、『F-ZERO』を代表するマシンの一つ。"},
{q: "第70問", difficulty: "veryhard", choices: ["『Slay the Spire』の最初のキャラクター<br>「アイアンクラッド」の初期レリックは？", "A.賢者の石", "B.ネオーの祝福", "C.スネッコアイ", "D.バーニング・ブラッド"], ans: "D", explain: "バーニング・ブラッドはアイアンクラッド固有の初期レリック。戦闘終了時にHPを回復する効果を持つ。"},
{q: "第71問", difficulty: "veryhard", choices: ["『Outer Wilds』で、太陽が超新星爆発を起こすまでの<br>制限時間は？", "A.10分", "B.30分", "C.60分", "D.22分"], ans: "D", explain: "本作では太陽系が超新星爆発を起こすまでの約22分間が繰り返されるタイムループの中で、プレイヤーが知識を積み重ねて謎を解いていく。"},
{q: "第72問", difficulty: "veryhard", choices: ["『真・女神転生』シリーズで、悪魔合体を行う場所は？", "A.悪魔の家", "B.合成所", "C.ベルベットルーム", "D.邪教の館"], ans: "D", explain: "邪教の館は、仲魔となった悪魔を合体させて新たな悪魔を生み出す、シリーズを代表する施設。"},
{q: "第73問", difficulty: "veryhard", choices: ["『ポータル（Portal）』で、施設内でプレイヤーに指示を<br>出しながら監視する人工知能の名前は？", "A.HAL 9000", "B.SHODAN", "C.Wheatley", "D.GLaDOS"], ans: "D", explain: "GLaDOSはアパチャーサイエンス研究所を管理する人工知能で、主人公チェルにさまざまなテストを受けさせる重要な存在。"},
{q: "第74問", difficulty: "veryhard", choices: ["『SEKIRO: SHADOWS DIE TWICE』で、主人公「狼」が<br>仕える御子の名前は？", "A.九郎", "B.弦一郎", "C.一心", "D.仏師"], ans: "A", explain: "九郎は竜胤の力を持つ御子で、主人公「狼」が仕える主君。物語の中心となる重要な人物。"},
{q: "第75問", difficulty: "veryhard", choices: ["『アーマード・コア6』の主人公（プレイヤー）に<br>付与されている識別番号は？", "A.V.IV", "B.G13", "C.AC-001", "D.C4-621"], ans: "D", explain: "C4-621は主人公に付与された識別コード。ハンドラー・ウォルターからは「621」と呼ばれている。"},
{q: "第76問", difficulty: "veryhard", choices: ["『Hollow Knight（ホロウナイト）』で、<br>舞台となる崩壊した虫たちの王国の名前は？", "A.ダートマウス", "B.ディープネスト", "C.パラサイト", "D.ハロウネスト（Hallownest）"], ans: "D", explain: "ハロウネスト（Hallownest）は、かつて栄華を極めた地下の王国。謎の感染によって崩壊しており、主人公はその王国の各地を探索する。"},
{q: "第77問", difficulty: "veryhard", choices: ["『ホグワーツ・レガシー』の舞台となっている<br>年代はいつ頃？", "A.1990年代", "B.1700年代初頭", "C.1920年代", "D.1800年代後半（19世紀末）"], ans: "D", explain: "本作は『ハリー・ポッター』シリーズより約100年前の1800年代後半（19世紀末）の魔法界を舞台としている。"},
{q: "第78問", difficulty: "veryhard", choices: ["『Cyberpunk 2077』で、主人公Vの頭の中に意識が共生することになる元ロックスターの名前は？", "A.ジャッキー・ウェルズ", "B.ゴロウ・タケムラ", "C.ジョニー・シルヴァーハンド", "D.アルト・カニンガム"], ans: "C", explain: "ジョニー・シルヴァーハンドは伝説的なロッカーボーイで、Vの頭の中にデジタル人格として現れる重要人物。キアヌ・リーブスが演じている。"},
{q: "第79問", difficulty: "veryhard", choices: ["『バディミッション BOND』で、主人公ルークが所属する<br>警察組織がある地域の名前は？", "A.バディ州", "B.ハワイ州", "C.ネバダ州", "D.ミカグラ島"], ans: "D", explain: "ミカグラ島は本作の舞台となる島で、主人公ルークはミカグラ警察署に所属する警察官として活動している。"},
{q: "第80問", difficulty: "veryhard", choices: ["『13機兵防衛圏』の開発元はどこ？", "A.アトラス", "B.プラチナゲームズ", "C.ヴァニラウェア", "D.フロム・ソフトウェア"], ans: "C", explain: "『13機兵防衛圏』はヴァニラウェアが開発し、アトラスから発売されたアドベンチャーゲーム。ヴァニラウェアならではの緻密な2Dグラフィックも特徴。"},
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

; 難易度別の出題問題抽出（標準動作）
tf.selected_questions = tf.filtered.slice(0, tf.question_count);

tf.current_index = 0;
tf.score = 0;

; 設定値初期化（★ BGMをゲームジャンル用へ変更）
if(tf.diff == "easy"){
    tf.max_life = 5;
    tf.life = 5;
    tf.time_limit = 60;
    tf.hint_count = 5;
    tf.current_bg = 'haikei/easy_haikei.png';
    tf.current_bgm = 'game_easy.ogg';
} else if(tf.diff == "normal"){
    tf.max_life = 4;
    tf.life = 4;
    tf.time_limit = 60;
    tf.hint_count = 3;
    tf.current_bg = 'haikei/normal_haikei.png';
    tf.current_bgm = 'game_normal.ogg';
} else if(tf.diff == "hard"){
    tf.max_life = 2;
    tf.life = 2;
    tf.time_limit = 60;
    tf.hint_count = 1;
    tf.current_bg = 'haikei/hard_haikei.png';
    tf.current_bgm = 'game_hard.ogg';
} else if(tf.diff == "veryhard"){
    tf.max_life = 1;
    tf.life = 1;
    tf.time_limit = 15;
    tf.hint_count = 0;
    tf.current_bg = 'haikei/very_hard_haikei.png';
    tf.current_bgm = 'game_very_hard.ogg';
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

; ★ 出題前に演出用の古い立ち絵を画面から完全に消去
[free layer="1" name="chara_stand"]
[freeimage layer="1"]

; ★ キャラ立ち絵（通常顔）描画の準備
[iscript]
var chara = sf.selected_chara || 'onp';
tf.chara_normal = chara + "/" + chara + "_normal.png";

// ★ 描画直前に tf. 変数へサイズと座標を確実にセット（undefined回避）
if (chara == 'onp') {
    tf.q_x = "900"; tf.q_y = "120"; tf.q_w = "550";
} else if (chara == 'quiz') {
    tf.q_x = "900"; tf.q_y = "140"; tf.q_w = "400";
} else if (chara == 'tukuyomi') {
    tf.q_x = "900"; tf.q_y = "160"; tf.q_w = "450";
} else if (chara == 'ameno') {
    tf.q_x = "850"; tf.q_y = "130"; tf.q_w = "550";
} else if (chara == 'zunda') {
    tf.q_x = "900"; tf.q_y = "150"; tf.q_w = "500";
}
[endscript]

[layopt layer="1" visible="true"]

; ★ &f. から &tf. に変更して呼び出し（これで確実に値が渡ります）
[image storage="&tf.chara_normal" layer="1" x="&tf.q_x" y="&tf.q_y" width="&tf.q_w" name="chara_stand"]

; ★ 第1問目の開始時だけ、bgm1 を止めて難易度BGMに切り替える
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

// CSS transition で右側から削っていくアニメーションを開始
setTimeout(function(){
    $(".time_gage").css({
        "transition": "clip-path " + tf.time_limit + "s linear",
        "clip-path": "inset(0 100% 0 0)"
    });
}, 20);
[endscript]

; タイマーSE再生
[stopse]
[playse storage="se/timer2.ogg" loop="true" cond="tf.time_limit <= 15"]
[playse storage="se/timer1.ogg" loop="true" cond="tf.time_limit > 15"]

; ★ カウントダウン待機
[wait time="&tf.wait_time"]

; 時間切れ時はそのまま *time_up へ
[jump target="*time_up" storage=""]


; --- 7. 回答判定処理 ---

*check_answer

; タイマー音を停止
[stopse]

[iscript]
$(".time_gage").css("transition", "none");

// 選択された回答のテキストを取得して正誤判定
var selected_text = tf.shuffled[tf.choice_num];
tf.is_correct = (selected_text === tf.correct_text);

var chara = sf.selected_chara || 'onp';
if (tf.is_correct) {
    tf.chara_result = chara + "/" + chara + "_smile.png";
} else {
    tf.chara_result = chara + "/" + chara + "_sad.png";
}
[endscript]

; タイマーUI等を削除
[free layer="2" name="time_gage"]
[free layer="2" name="time_cover"]
[free layer="2" name="time_bar_hk"]

; 表情の切り替え
[freeimage layer="1"]
[layopt layer="1" visible="true"]
[image storage="&tf.chara_result" layer="1" x="&tf.q_x" y="&tf.q_y" width="&tf.q_w" name="chara_stand"]

; --- 正解の場合 ---
[if exp="tf.is_correct == true"]

    ; ★ 前のSEをクリアして確実に正解音を再生
    [playse storage="se/seikai.ogg" clear="true"]
    [eval exp="tf.score++"]

    [tb_show_message_window]
    正解！[r]
    解説：[emb exp='tf.selected_questions[tf.current_index].explain'][p]

; --- 不正解の場合 ---
[else]

    ; ★ 前のSEをクリアして確実に不正解音を再生
    [playse storage="se/hazure.ogg" clear="true"]
    [eval exp="tf.life = tf.life - 1"]
    [iscript]
    if(tf.life < 0){ tf.life = 0; }
    [endscript]

    [call target="*show_life" storage=""]

    [tb_show_message_window]
    不正解……！[r]
    正解は「[emb exp="tf.correct_text"]」でした。[r]
    解説：[emb exp='tf.selected_questions[tf.current_index].explain'][p]

[endif]

[free layer="2" name="question_text"]
[free layer="2" name="hint_btn"]

[jump cond="tf.life <= 0" target="*quiz_end" storage=""]

[freeimage layer="1"]
[eval exp="tf.current_index++"]
[jump target="*question_loop" storage=""]


; ========================================
; ★ ヒントボタン押下時の処理（ハズレ2つ消去）
; ========================================
*use_hint

[iscript]
// 1. ヒント使用フラグをONにする
tf.hint_used = true;

// 2. 残りヒント数を減らす
tf.hint_count--;

// 3. 不正解の選択肢から「2つ」をランダムに選んで非表示にする
var q = tf.selected_questions[tf.current_index];
var correct = tf.correct_text;
var wrong_indices = [];

// 表示中で、かつ不正解の選択肢インデックスを配列に抽出
for (var i = 0; i < 4; i++) {
    if (tf.shuffled[i] !== correct && tf["show" + i] === true) {
        wrong_indices.push(i);
    }
}

// ハズレ選択肢をランダムにシャッフル
for (var k = wrong_indices.length - 1; k > 0; k--) {
    var m = Math.floor(Math.random() * (k + 1));
    var tmp = wrong_indices[k];
    wrong_indices[k] = wrong_indices[m];
    wrong_indices[m] = tmp;
}

// シャッフルした配列から先頭2つを取り出して非表示（false）にする
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

; ボタン類を一括削除して残った選択肢のみ再配置
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
$(".time_gage").css("transition", "none");
[endscript]

; タイマーUIを消去
[free layer="2" name="time_gage"]
[free layer="2" name="time_cover"]
[free layer="2" name="time_bar_hk"]

[iscript]
var chara = sf.selected_chara || 'onp';
tf.chara_sad = chara + "/" + chara + "_sad.png";
[endscript]

[freeimage layer="1"]
[layopt layer="1" visible="true"]
[image storage="&tf.chara_sad" layer="1" x="&tf.q_x" y="&tf.q_y" width="&tf.q_w" name="chara_stand"]

[eval exp="tf.life = tf.life - 1"]
[iscript]
if(tf.life < 0){ tf.life = 0; }
[endscript]

[call target="*show_life" storage=""]

[tb_show_message_window]

時間切れ！[r]
正解は「[emb exp="tf.correct_text"]」でした。[p]

解説：[emb exp='tf.selected_questions[tf.current_index].explain'][p]

[free layer="2" name="question_text"]
[free layer="2" name="hint_btn"]

[jump cond="tf.life <= 0" target="*quiz_end" storage=""]

[freeimage layer="1"]
[eval exp="tf.current_index++"]
[jump target="*question_loop" storage=""]


; --- ゲーム終了処理（ゲームジャンル仕様） ---

*quiz_end

[cm]
[tb_show_message_window]

貴方は[emb exp="tf.question_count"]点中[emb exp="tf.score"]点です！[p]

[iscript]
tf.current_genre = 'game';

var key_normal   = tf.current_genre + '_normal';
var key_hard     = tf.current_genre + '_hard';
var key_veryhard = tf.current_genre + '_veryhard';

tf.show_dialog = false;
tf.alert_msg   = "";

if (tf.diff === 'easy' && !sf[key_normal]) {
    sf.game_easy = true;
    sf[key_normal] = true;
    sf.unlock_genre = true;
    tf.show_dialog = true;
    tf.alert_msg = "全ジャンル ＆ ゲームの難易度 NORMAL が解放されました！";
}

if (tf.diff === 'normal' && tf.score >= 8 && !sf[key_hard]) {
    sf[key_hard] = true;
    tf.show_dialog = true;
    tf.alert_msg = "8問以上正解！ゲームの難易度 HARD が解放されました！";
}

if (tf.diff === 'hard' && tf.score >= 8 && tf.life == tf.max_life && !sf[key_veryhard]) {
    sf[key_veryhard] = true;
    tf.show_dialog = true;
    tf.alert_msg = "ノーダメージクリア！ゲームの最高難易度 VERY HARD が解放されました！";
}
[endscript]

[dialog type="alert" text="&tf.alert_msg" cond="tf.show_dialog == true"]

[tb_hide_message_window]
[freeimage layer="2"]
[freeimage layer="1"]

[jump storage="title_screen.ks" target="*game_end"]
