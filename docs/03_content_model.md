# チケット03: Content モデル

## 概要
コンテンツのデータモデル・バリデーション・アソシエーションを実装する。

## TODO

### マイグレーション
- [x] `rails generate model Content` 実行
- [x] マイグレーションに以下カラムを追加
  - [x] `user_id:references`
  - [x] `title:string`（null: false）
  - [x] `url:string`
  - [x] `media_type:string`（null: false）
  - [x] `status:integer`（null: false, default: 0）
  - [x] `rating:integer`
  - [x] `memo:text`
- [x] `rails db:migrate` 実行

### モデル実装
- [x] `belongs_to :user` アソシエーション
- [x] `enum :status, { unread: 0, done: 1 }` の定義
- [x] `MEDIA_TYPES = %w[book youtube video article other]` 定数定義

### バリデーション
- [x] `title`：必須・255文字以内
- [x] `url`：任意・入力された場合のみ URL 形式チェック（`URI::DEFAULT_PARSER.make_regexp`）
- [x] `media_type`：必須・`MEDIA_TYPES` の値のみ許可
- [x] `status`：必須
- [x] `rating`：1〜5 の整数・`status` が `done` のときのみ入力可（カスタムバリデーション）

## 完了条件
- [x] バリデーションが正しく動作（rails runner で全ケース確認済み）
- [x] 不正な `rating`（unread なのに rating あり）がバリデーションエラーになる
