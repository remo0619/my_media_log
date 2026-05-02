# チケット09: デプロイ（Heroku）

## 概要
Heroku へのデプロイ設定と本番環境の動作確認。

## TODO

### Heroku 事前設定
- [ ] Heroku CLI をインストール・ログイン
- [ ] `heroku create mymedia-log` でアプリ作成
- [ ] `heroku addons:create heroku-postgresql` で PostgreSQL アドオン追加

### Rails 本番設定
- [ ] `config/environments/production.rb` の設定確認
- [ ] `Procfile` を作成（`web: bundle exec puma -C config/puma.rb`）
- [ ] `RAILS_MASTER_KEY` を Heroku の環境変数に設定
- [ ] Tailwind の本番ビルドが含まれることを確認（`assets:precompile`）

### デプロイ手順
- [ ] `git push heroku main` でデプロイ
- [ ] `heroku run rails db:migrate` でマイグレーション実行
- [ ] `heroku logs --tail` でエラーがないことを確認

### 動作確認
- [ ] ランディングページが表示される
- [ ] ユーザー登録・ログインができる
- [ ] コンテンツの CRUD が動作する
- [ ] HTTPS でアクセスできる

## 完了条件
- Heroku URL でアプリが正常に動作する
- 本番データベースにマイグレーションが適用されている
