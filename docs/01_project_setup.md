# チケット01: プロジェクトセットアップ

## 概要
Rails アプリの初期構築。全機能の土台となる設定を行う。

## TODO

### Rails プロジェクト作成
- [ ] `rails new mymedia_log --database=postgresql` でプロジェクト生成
- [ ] `.ruby-version` でバージョンを固定
- [ ] `Gemfile` に必要な gem を追加（下記参照）
- [ ] `bundle install` 実行

### Gem 追加
- [ ] `devise`（認証）
- [ ] `tailwindcss-rails`（スタイリング）
- [ ] `rspec-rails`（テスト）
- [ ] `factory_bot_rails`（テスト用ファクトリ）
- [ ] `faker`（テスト用ダミーデータ）
- [ ] `capybara` / `selenium-webdriver`（システムスペック）

### データベース設定
- [ ] `config/database.yml` で PostgreSQL 接続設定
- [ ] `rails db:create` でデータベース作成確認

### Tailwind CSS セットアップ
- [ ] `rails tailwindcss:install` 実行
- [ ] `application.html.erb` に Tailwind の読み込みを確認

### RSpec セットアップ
- [ ] `rails generate rspec:install` 実行
- [ ] `spec/rails_helper.rb` に FactoryBot / Capybara 設定を追加
- [ ] `.rspec` に `--format documentation` を設定

### GitHub / バージョン管理
- [ ] `.gitignore` に秘密情報・ログ等を追加
- [ ] 初回コミット・GitHub リポジトリ作成・push

## 完了条件
- `rails server` が起動しデフォルト画面が表示される
- `bundle exec rspec` がエラーなく実行できる
