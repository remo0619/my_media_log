# チケット02: 認証（Devise）

## 概要
Devise を使ったユーザー登録・ログイン・ログアウト機能。`username` カラムの追加も含む。

## TODO

### Devise セットアップ
- [x] `rails generate devise:install` 実行
- [x] `config/initializers/devise.rb` で `config.mailer_sender` を設定
- [x] `config/environments/development.rb` に `config.action_mailer.default_url_options` を確認（生成時に設定済み）
- [x] `rails generate devise User` で User モデル生成
- [x] マイグレーションファイルに `username` カラムを追加（not null, unique index）
- [x] `rails db:migrate` 実行

### User モデル
- [x] `username` バリデーション実装（必須・一意・2〜20文字）
- [x] `email` バリデーション確認（Devise 標準の :validatable で対応）
- [x] `has_many :contents, dependent: :destroy` アソシエーション追加

### Devise ビューのカスタマイズ
- [x] `rails generate devise:views` 実行
- [x] 新規登録フォームに `username` フィールドを追加
- [x] Tailwind でログイン・登録フォームをスタイリング

### ストロングパラメータ
- [x] `ApplicationController` に `configure_permitted_parameters` を追加し `username` を許可

### 認可（before_action）
- [x] `ApplicationController` に `authenticate_user!` を設定（全ページ認証必須）
- [x] `PagesController#top`（ランディングページ）のみ認証をスキップ

### レイアウト
- [x] `application.html.erb` にナビバー（ユーザー名・ログアウト / ログイン・新規登録）を追加
- [x] フラッシュメッセージ表示エリアを追加

## 完了条件
- [x] User バリデーションが正常に動作（rails runner で確認済み）
- [x] ブラウザで新規ユーザー登録ができる
- [x] ログイン・ログアウトができる
- [ ] 未ログイン状態でコンテンツ一覧にアクセスするとログインページへリダイレクトされる
