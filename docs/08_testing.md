# チケット08: RSpec テスト

## 概要
モデルスペック・リクエストスペック・システムスペックを実装する。

## TODO

### FactoryBot ファクトリ定義
- [ ] `spec/factories/users.rb`：User ファクトリ（email / username / password）
- [ ] `spec/factories/contents.rb`：Content ファクトリ（各カラムのデフォルト値）

### モデルスペック（spec/models/）
- [ ] `user_spec.rb`
  - [ ] `username` バリデーション（必須・一意・2〜20文字）
  - [ ] `email` バリデーション（必須・一意・メール形式）
  - [ ] `has_many :contents` アソシエーション
- [ ] `content_spec.rb`
  - [ ] `title` バリデーション（必須・255文字以内）
  - [ ] `url` バリデーション（任意・URL形式）
  - [ ] `media_type` バリデーション（必須・許可値のみ）
  - [ ] `status` バリデーション（必須）
  - [ ] `rating` バリデーション（1〜5・done 時のみ）
  - [ ] `belongs_to :user` アソシエーション

### リクエストスペック（spec/requests/）
- [ ] `contents_spec.rb`
  - [ ] 未ログイン時に一覧・詳細・編集がリダイレクトされる
  - [ ] `GET /contents`：一覧取得
  - [ ] `POST /contents`：有効なパラメータで作成成功
  - [ ] `POST /contents`：無効なパラメータで422
  - [ ] `PATCH /contents/:id`：本人が更新できる
  - [ ] `DELETE /contents/:id`：本人が削除できる
  - [ ] `PATCH /contents/:id`：他ユーザーが更新しようとすると404
  - [ ] `PATCH /contents/:id/toggle_status`：ステータス切り替え

### システムスペック（spec/system/）
- [ ] `user_registration_spec.rb`
  - [ ] ユーザー登録フローが完了してコンテンツ一覧へ遷移
- [ ] `content_flow_spec.rb`
  - [ ] ログイン → コンテンツ新規登録 → 一覧で確認
  - [ ] ステータス切り替えが画面に反映される
  - [ ] フィルタ・検索が正常に動作する

## 完了条件
- `bundle exec rspec` が全スペック green で通過する
