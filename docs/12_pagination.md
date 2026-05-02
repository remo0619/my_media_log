# チケット12: ページネーション

## 概要
コンテンツ一覧に kaminari によるページネーション（1ページあたり20件）を実装する。

## TODO

### Gem追加
- [x] `Gemfile` に `kaminari` を追加（チケット11と同時に追加）
- [x] `bundle install`

### コントローラー
- [x] `ContentsController#index` に `.page(params[:page]).per(20)` を追加

### ビュー
- [x] `app/views/contents/index.html.erb` にページネーションリンクを追加（`paginate @contents`）
- [x] `app/views/kaminari/` 配下にTailwind CSS対応のカスタムビューを作成

### i18n
- [ ] `config/locales/ja.yml` に kaminari の日本語訳を追加（任意）

## 完了条件
- [x] 21件以上のコンテンツがある場合にページネーションリンクが表示される
- [x] フィルタ・検索と組み合わせてもページネーションが正しく動作する
