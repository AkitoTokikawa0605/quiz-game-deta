; ===================================
; データ初期化・リセット処理 (reset.ks)
; ===================================

*start

; 誤操作防止の確認ダイアログ
[dialog type="alert" text="難易度やジャンルの解放状況を初期状態に戻しますか？" target="*do_reset" target_cancel="*cancel_reset"]
[s]

; --- 「はい」が押された場合 ---
*do_reset

[iscript]
// 1. 解放状況などを全削除
for (var key in sf) {
    if (sf.hasOwnProperty(key)) {
        delete sf[key];
    }
}

// 2. キャラクター選択が未設定にならないよう初期値を入れる（ずんだもん等）
sf.selected_chara = "zunda";
[endscript]

; 確定ポップアップ表示
[dialog type="alert" text="すべての解放条件を初期化しました！"]

; タイトル画面へ戻る
[jump storage="title_screen.ks" target="*show_menu"]


; --- 「いいえ（キャンセル）」が押された場合 ---
*cancel_reset

; 何もせずタイトル画面へ戻る
[jump storage="title_screen.ks" target="*show_menu"]