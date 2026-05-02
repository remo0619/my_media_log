# チケット04: コンテンツ CRUD

## 概要
コンテンツの新規登録・一覧・詳細・編集・削除を実装する。

## TODO

### ルーティング
- [ ] `config/routes.rb` に `resources :contents` を追加

### ContentsController
- [ ] `index`：ログインユーザーのコンテンツ一覧を取得
- [ ] `show`：詳細表示（本人のコンテンツのみ）
- [ ] `new` / `create`：新規登録フォーム・保存
- [ ] `edit` / `update`：編集フォーム・更新
- [ ] `destroy`：削除
- [ ] `before_action :set_content` で `show` / `edit` / `update` / `destroy` 共通化
- [ ] `before_action :authorize_content!` で本人確認（他ユーザーは 404）
- [ ] `content_params` でストロングパラメータ定義

### ビュー
- [ ] `index.html.erb`：コンテンツ一覧テーブルまたはカードレイアウト
- [ ] `show.html.erb`：タイトル・URL・種別・メモ・評価・ステータス表示
- [ ] `new.html.erb` / `_form.html.erb`：登録・編集共通フォーム
  - [ ] タイトル（text）
  - [ ] URL（text）
  - [ ] 種別（select）
  - [ ] メモ（textarea）
  - [ ] ステータス（select または radio）
  - [ ] 星評価（select、`status: done` 時のみ表示）
- [ ] `edit.html.erb`：`_form.html.erb` を render
- [ ] Tailwind でスタイリング

### 認可
- [ ] 他ユーザーのコンテンツへのアクセスは 404 を返す
- [ ] 編集・削除ボタンは本人のコンテンツにのみ表示

## 完了条件
- CRUD 全操作がブラウザで正常に動作する
- 他ユーザーのコンテンツ URL に直接アクセスすると 404 になる
