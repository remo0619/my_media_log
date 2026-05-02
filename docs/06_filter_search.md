# チケット06: 絞り込み・検索

## 概要
コンテンツ一覧に種別フィルタ・ステータスフィルタ・タイトルキーワード検索を実装する。

## TODO

### ContentsController（index アクション）
- [ ] クエリパラメータ `media_type`・`status`・`q` を受け取る
- [ ] `scope` またはメソッドチェーンでフィルタリング実装
  ```ruby
  contents = current_user.contents
  contents = contents.where(media_type: params[:media_type]) if params[:media_type].present?
  contents = contents.where(status: params[:status]) if params[:status].present?
  contents = contents.where("title LIKE ?", "%#{params[:q]}%") if params[:q].present?
  ```
- [ ] SQL インジェクション対策（プレースホルダ使用）

### Content モデル（scope 定義）
- [ ] `scope :by_media_type, ->(type) { where(media_type: type) if type.present? }`
- [ ] `scope :by_status, ->(st) { where(status: st) if st.present? }`
- [ ] `scope :search_title, ->(q) { where("title LIKE ?", "%#{q}%") if q.present? }`

### ビュー（一覧画面）
- [ ] 種別フィルタ：select タグ（全種別 + 選択肢）
- [ ] ステータスフィルタ：select タグ（全・未消化・消化済み）
- [ ] キーワード検索：text_field + 検索ボタン
- [ ] フォームは `get` メソッドで `contents_path` に送信
- [ ] 現在の絞り込み条件が選択状態で表示されるよう `selected` を設定
- [ ] 「絞り込みをリセット」リンクを設置

## 完了条件
- 種別・ステータス・キーワードの単独および組み合わせ検索が正常に動作する
- ページ再読み込み後も絞り込み状態が保たれる
