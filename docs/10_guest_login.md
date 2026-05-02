# チケット10: ゲストログイン

## 概要
ユーザー登録なしにアプリを試せるゲストログイン機能を実装する。
ログイン・新規登録ページにゲストログインボタンを設置し、ゲストユーザーはプロフィール編集不可とする。

## TODO

### モデル・DB
- [x] `users` テーブルに `guest` boolean カラムを追加（デフォルト: false）
- [x] `User` モデルに `User.guest` クラスメソッドを追加（find_or_create_by）

### コントローラー
- [x] `GuestSessionsController` を作成（`create` アクション）
  - 共有ゲストユーザーを `find_or_create_by` で取得
  - `sign_in` してコンテンツ一覧へリダイレクト

### ルーティング
- [x] `post '/guest_login', to: 'guest_sessions#create'` を追加

### ビュー
- [x] ログインページ（`devise/sessions/new`）にゲストログインボタンを追加
- [x] 新規登録ページ（`devise/registrations/new`）にゲストログインボタンを追加

### 認可
- [x] `RegistrationsController` で `reject_guest_user!` before_action を実装
- [x] Devise `registrations#edit` / `registrations#update` でゲスト判定してリダイレクト

## 完了条件
- [x] ゲストログインボタンからログインできる
- [x] ゲストユーザーはコンテンツの登録・閲覧ができる
- [x] ゲストユーザーがマイページ（プロフィール編集）にアクセスすると弾かれる
