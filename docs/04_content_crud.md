# チケット04: コンテンツ CRUD

## 概要
コンテンツの新規登録・一覧・詳細・編集・削除を実装する。

## TODO

### ルーティング
- [x] `config/routes.rb` に `resources :contents` を追加

### ContentsController
- [x] `index`：ログインユーザーのコンテンツ一覧を取得（作成日降順）
- [x] `show`：詳細表示（本人のコンテンツのみ）
- [x] `new` / `create`：新規登録フォーム・保存
- [x] `edit` / `update`：編集フォーム・更新
- [x] `destroy`：削除
- [x] `before_action :set_content` で `show` / `edit` / `update` / `destroy` 共通化
- [x] `before_action :authorize_content!` で本人確認（他ユーザーは 404）
- [x] `content_params` でストロングパラメータ定義

### ビュー
- [x] `index.html.erb`：カードレイアウト（種別バッジ・ステータスバッジ・星評価）
- [x] `show.html.erb`：タイトル・URL・種別・メモ・評価・ステータス表示
- [x] `_form.html.erb`：登録・編集共通フォーム
  - [x] タイトル（text）
  - [x] URL（url）
  - [x] 種別（select）
  - [x] メモ（textarea）
  - [x] ステータス（select）
  - [x] 星評価（select、`status: done` 時のみ JS で表示）
- [x] `new.html.erb` / `edit.html.erb`：`_form` を render
- [x] Tailwind でスタイリング
- [x] `shared/_error_messages` パーシャルを追加

### 認可
- [x] 他ユーザーのコンテンツへのアクセスは 404 を返す
- [x] 編集・削除ボタンは詳細画面のみ表示（本人のコンテンツのみアクセス可能）

### その他
- [x] `ApplicationHelper#t_media_type` で種別の日本語ラベルを表示
- [x] `PagesController#top` のログイン済みリダイレクトを有効化

## 完了条件
- [x] CRUD 全操作がブラウザで正常に動作する
- [x] 他ユーザーのコンテンツ URL に直接アクセスすると 404 になる
- [x] 未ログイン状態でコンテンツ一覧にアクセスするとログインページへリダイレクトされる
