# チケット05: ステータス管理

## 概要
`unread` ↔ `done` の切り替えを実装する。切り替え時に rating のリセット処理も行う。

## TODO

### ルーティング
- [ ] `resources :contents` にカスタムアクションを追加
  ```ruby
  member do
    patch :toggle_status
  end
  ```

### ContentsController
- [ ] `toggle_status` アクションを実装
  - [ ] `unread` → `done` に切り替え
  - [ ] `done` → `unread` に切り替え（`rating` を `nil` にリセット）
  - [ ] 切り替え後に一覧または詳細へリダイレクト

### ビュー
- [ ] 一覧・詳細画面にステータス切り替えボタンを設置
  - [ ] `unread` のとき「消化済みにする」ボタン
  - [ ] `done` のとき「未消化に戻す」ボタン
- [ ] ボタンは `button_to` で `patch` メソッドを使用

## 完了条件
- 一覧・詳細からワンクリックでステータスを切り替えられる
- `done` → `unread` 切り替え時に `rating` が消える
