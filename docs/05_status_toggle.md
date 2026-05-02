# チケット05: ステータス管理

## 概要
`unread` ↔ `done` の切り替えを実装する。切り替え時に rating のリセット処理も行う。

## TODO

### ルーティング
- [x] `resources :contents` に `member { patch :toggle_status }` を追加

### ContentsController
- [x] `toggle_status` アクションを実装
  - [x] `unread` → `done` に切り替え
  - [x] `done` → `unread` に切り替え（`rating` を `nil` にリセット）
  - [x] `redirect_back` で元の画面（一覧 or 詳細）へリダイレクト

### ビュー
- [x] 一覧画面の各カード右端にトグルボタンを設置
  - [x] `unread` のとき「消化済みにする」（緑枠）
  - [x] `done` のとき「未消化に戻す」（グレー枠）
- [x] 詳細画面のアクションエリアにトグルボタンを設置
- [x] ボタンは `button_to` で `patch` メソッドを使用

## 完了条件
- [x] 一覧・詳細からワンクリックでステータスを切り替えられる
- [x] `done` → `unread` 切り替え時に `rating` が消える
