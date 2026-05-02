# チケット02: 認証（Devise）

## 概要
Devise を使ったユーザー登録・ログイン・ログアウト機能。`username` カラムの追加も含む。

## TODO

### Devise セットアップ
- [ ] `rails generate devise:install` 実行
- [ ] `config/initializers/devise.rb` で `config.mailer_sender` を設定
- [ ] `config/environments/development.rb` に `config.action_mailer.default_url_options` を設定
- [ ] `rails generate devise User` で User モデル生成
- [ ] マイグレーションファイルに `username` カラムを追加
- [ ] `rails db:migrate` 実行

### User モデル
- [ ] `username` バリデーション実装（必須・一意・2〜20文字）
- [ ] `email` バリデーション確認（Devise 標準）
- [ ] `has_many :contents, dependent: :destroy` アソシエーション追加

### Devise ビューのカスタマイズ
- [ ] `rails generate devise:views` 実行
- [ ] 新規登録フォームに `username` フィールドを追加
- [ ] Tailwind でフォームをスタイリング

### ストロングパラメータ
- [ ] `ApplicationController` に `configure_permitted_parameters` を追加し `username` を許可

### 認可（before_action）
- [ ] `ApplicationController` に `authenticate_user!` を設定（全ページ認証必須）
- [ ] トップ / ランディングページのみ認証をスキップ

## 完了条件
- 新規ユーザー登録ができる
- ログイン・ログアウトができる
- 未ログイン状態でコンテンツ一覧にアクセスするとログインページへリダイレクトされる
