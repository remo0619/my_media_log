# チケット06: 絞り込み・検索

## 概要
コンテンツ一覧に種別フィルタ・ステータスフィルタ・タイトルキーワード検索を実装する。

## TODO

### ContentsController（index アクション）
- [x] クエリパラメータ `media_type`・`status`・`q` を受け取る
- [x] scope のメソッドチェーンでフィルタリング実装
- [x] SQL インジェクション対策（`sanitize_sql_like` を使用）

### Content モデル（scope 定義）
- [x] `scope :by_media_type`
- [x] `scope :by_status`
- [x] `scope :search_title`（`sanitize_sql_like` で LIKE インジェクション対策）

### ビュー（一覧画面）
- [x] 種別フィルタ：select タグ（すべて + 5種別）
- [x] ステータスフィルタ：select タグ（すべて・未消化・消化済み）
- [x] キーワード検索：text_field + 検索ボタン
- [x] フォームは `get` メソッドで `contents_path` に送信
- [x] 現在の絞り込み条件が選択状態で表示される（`selected: params[...]`）
- [x] 「リセット」リンクを設置
- [x] 絞り込み結果が空のとき専用メッセージを表示

## 完了条件
- [x] 種別・ステータス・キーワードの単独および組み合わせ検索が正常に動作する
- [x] ページ再読み込み後も絞り込み状態が保たれる
