# チケット01: プロジェクトセットアップ

## 概要
Rails アプリの初期構築。全機能の土台となる設定を行う。

## TODO

### Rails プロジェクト作成
- [x] `rails new . --app-name=mymedia_log --database=postgresql --css=tailwind --skip-git` でプロジェクト生成
- [x] `.ruby-version` でバージョンを固定（Ruby 3.3.10）
- [x] `Gemfile` に必要な gem を追加（下記参照）
- [x] `bundle install` 実行

### Gem 追加
- [x] `devise`（認証）
- [x] `tailwindcss-rails`（スタイリング）
- [x] `rspec-rails`（テスト）
- [x] `factory_bot_rails`（テスト用ファクトリ）
- [x] `faker`（テスト用ダミーデータ）
- [x] `capybara` / `selenium-webdriver`（システムスペック）

### データベース設定
- [x] `config/database.yml` を `mymedia_log_*` に修正
- [x] `rails db:create` でデータベース作成確認

### Tailwind CSS セットアップ
- [x] `--css=tailwind` オプションで生成時にインストール済み
- [x] `application.html.erb` に Tailwind の読み込みを確認

### RSpec セットアップ
- [x] `rails generate rspec:install` 実行
- [x] `spec/rails_helper.rb` に FactoryBot / Capybara 設定を追加
- [x] `.rspec` に `--format documentation` を設定

### GitHub / バージョン管理
- [x] `.gitignore` に秘密情報・ログ等を追加
- [x] `git init` 実行
- [x] 初回コミット（101 files）
- [x] GitHub リポジトリ作成・push

## 完了条件
- [x] `bundle exec rspec` がエラーなく実行できる（0 examples, 0 failures）
- [x] `rails server` が起動しデフォルト画面が表示される（次チケット着手前に確認推奨）
