# チケット09: デプロイ（Heroku）

## 概要
Heroku へのデプロイ設定と本番環境の動作確認。

## TODO

### Rails 本番設定（コード側） ✅
- [x] `Procfile` を作成（`web: bundle exec puma -C config/puma.rb`）
- [x] `production.rb`：`require_master_key = true`
- [x] `production.rb`：Heroku 向け static file server 有効化
- [x] `production.rb`：`action_mailer.default_url_options` を `APP_HOST` env で設定
- [x] `assets:precompile` で Tailwind CSS がビルドされることを確認済み

### Heroku 操作（手動） 
- [ ] Heroku CLI インストール・ログイン（`heroku login`）
- [ ] アプリ作成（`heroku create`）
- [ ] PostgreSQL アドオン追加（`heroku addons:create heroku-postgresql`）
- [ ] 環境変数を設定
  ```
  heroku config:set RAILS_MASTER_KEY=$(cat config/master.key)
  heroku config:set APP_HOST=<アプリ名>.herokuapp.com
  ```
- [ ] デプロイ（`git push heroku main` または `git push heroku develop:main`）
- [ ] マイグレーション実行（`heroku run rails db:migrate`）
- [ ] ログ確認（`heroku logs --tail`）

### 動作確認
- [ ] ランディングページが表示される
- [ ] ユーザー登録・ログインができる
- [ ] コンテンツの CRUD が動作する
- [ ] HTTPS でアクセスできる

## 完了条件
- [ ] Heroku URL でアプリが正常に動作する
- [ ] 本番データベースにマイグレーションが適用されている

---

## デプロイ手順まとめ

```bash
# 1. Heroku アプリ作成
heroku login
heroku create        # または heroku create <アプリ名>

# 2. アドオン・環境変数
heroku addons:create heroku-postgresql:essential-0
heroku config:set RAILS_MASTER_KEY=$(cat config/master.key)
heroku config:set APP_HOST=$(heroku info -s | grep web_url | cut -d= -f2 | sed 's|https://||;s|/||')

# 3. デプロイ
git push heroku develop:main   # develop ブランチから main へ

# 4. DB セットアップ
heroku run rails db:migrate

# 5. 確認
heroku open
heroku logs --tail
```
