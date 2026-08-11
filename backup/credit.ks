;=========================================
; クレジット画面
;=========================================

*credit_start

;-----------------------------------------
; BGM
; 仮ファイル名
; 後で正式なBGMファイル名に変更
;-----------------------------------------
[playbgm storage="credit_bgm.ogg" loop="true"]

;-----------------------------------------
; クレジット本文
;-----------------------------------------

[font size="28"]

「新クイズで遊ぼう！」

企画

Akito_Tokikawa

ゲーム開発

Akito_Tokikawa
ChatGPT（チャッピー）

ゲームエンジン

TyranoBuilder

2015 © STRIKEWORKS All Rights Reserved.
Developper: ShikemokuMK

AI制作協力

Gemini

・クイズ問題制作協力
・背景・UI・ボタン等の制作協力
・オープニングムービー制作協力

BGM

「想い出のオルゴール 2018 / aum free Ver.」*
作詞・作曲：D’elf
歌：aum*
提供：d-elf.com

「ふわりと甘い休息（オルゴール）」
提供：音楽の卵

「無限大の小部屋」
提供：音楽の卵

CHARACTER ILLUSTRATION

坂本アヒル 様

・ずんだもん 立ち絵素材
・四国めたん 立ち絵素材
・春日部つむぎ 立ち絵素材
・雨晴はう 立ち絵素材

VOICE

VOICEVOX

・ずんだもん
・四国めたん
・春日部つむぎ
・雨晴はう

PLUGIN

ティラノスクリプト スライダープラグイン

製作者：さくた（@skt_tyrano）
©2023 さくた@skt_tyrano
License

;-----------------------------------------
; BACK
;-----------------------------------------

[button graphic="button17.png" target=*credit_back]

[s]

;=========================================
; BACK
;=========================================

*credit_back

[stopbgm]

; ※ここはタイトル画面のラベル確定後に変更
; [jump storage="title_screen.ks" target="タイトルのラベル"]

[s]