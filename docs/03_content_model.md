# チケット03: Content モデル

## 概要
コンテンツのデータモデル・バリデーション・アソシエーションを実装する。

## TODO

### マイグレーション
- [ ] `rails generate model Content` 実行
- [ ] マイグレーションに以下カラムを追加
  - [ ] `user_id:references`
  - [ ] `title:string`
  - [ ] `url:string`
  - [ ] `media_type:string`
  - [ ] `status:integer`
  - [ ] `rating:integer`
  - [ ] `memo:text`
- [ ] `rails db:migrate` 実行

### モデル実装
- [ ] `belongs_to :user` アソシエーション
- [ ] `enum status: { unread: 0, done: 1 }` の定義
- [ ] `MEDIA_TYPES = %w[book youtube video article other]` 定数定義

### バリデーション
- [ ] `title`：必須・255文字以内
- [ ] `url`：任意・入力された場合のみ URL 形式チェック（正規表現 or `URI.parse`）
- [ ] `media_type`：必須・`MEDIA_TYPES` の値のみ許可
- [ ] `status`：必須
- [ ] `rating`：1〜5 の整数・`status` が `done` のときのみ入力可
  - [ ] カスタムバリデーション or `validates_numericality_of` で実装

## 完了条件
- `rails console` でバリデーションが正しく動作する
- 不正な `rating`（unread なのに rating あり）がバリデーションエラーになる
