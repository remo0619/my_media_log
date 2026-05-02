# チケット08: RSpec テスト

## 概要
モデルスペック・リクエストスペック・システムスペックを実装する。

## TODO

### FactoryBot ファクトリ定義
- [x] `spec/factories/users.rb`：sequence で email/username を一意生成
- [x] `spec/factories/contents.rb`：valid defaults、`:done` / `:with_url` trait

### モデルスペック（spec/models/）
- [x] `user_spec.rb`
  - [x] `username` バリデーション（必須・一意・2〜20文字）
  - [x] `email` バリデーション（必須・一意・メール形式）
  - [x] `has_many :contents`・`dependent: :destroy`
- [x] `content_spec.rb`
  - [x] `title` バリデーション（必須・255文字以内）
  - [x] `url` バリデーション（任意・http/https のみ・ftp は無効）
  - [x] `media_type` バリデーション（必須・許可値のみ）
  - [x] `status` バリデーション
  - [x] `rating` バリデーション（1〜5・done 時のみ・unread+rating で無効）
  - [x] `belongs_to :user`

### リクエストスペック（spec/requests/）
- [x] `contents_spec.rb`
  - [x] 未ログイン時に一覧・詳細・編集がリダイレクトされる
  - [x] `GET /contents`：200
  - [x] `POST /contents`：有効なパラメータで作成・リダイレクト
  - [x] `POST /contents`：無効なパラメータで 422
  - [x] `PATCH /contents/:id`：本人が更新できる
  - [x] `DELETE /contents/:id`：本人が削除できる
  - [x] `GET /contents/:id`：他ユーザーは 404
  - [x] `PATCH /contents/:id/toggle_status`：ステータス切り替え・rating リセット

### システムスペック（spec/system/）
- [x] `user_registration_spec.rb`：登録フロー → コンテンツ一覧へ遷移
- [x] `content_flow_spec.rb`
  - [x] ログイン → 登録 → 詳細ページ確認
  - [x] 一覧からステータス切り替え
  - [x] 詳細から unread 戻し + rating リセット確認
  - [x] 種別・ステータス・キーワード絞り込み、リセット

## 完了条件
- [x] `bundle exec rspec` 47 examples, 0 failures
