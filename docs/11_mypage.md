# チケット11: マイページ

## 概要
ユーザー情報編集ページと、種別ごとのコンテンツ割合グラフ（chartkick + groupdate）を実装する。

## TODO

### Gem追加
- [x] `Gemfile` に `chartkick` / `groupdate` を追加
- [x] `bundle install`
- [x] chartkick / chart.js を importmap に追加
- [x] application.js に `import "chartkick"` / `import "chart.js"` を追加

### ルーティング・コントローラー
- [x] `mypages_controller.rb` を作成
  - `show` アクション：ユーザー情報表示 + グラフ用データ生成
- [x] `get 'mypage', to: 'mypages#show'` をルーティングに追加

### ビュー
- [x] `app/views/mypages/show.html.erb` を作成
  - ユーザー名・メールアドレス表示
  - 「プロフィールを編集する」リンク（ゲストは非表示）
  - 種別ごとのコンテンツ割合グラフ（pie_chart）
- [x] Devise の edit ビューで username 編集フォームが既にある（確認済み）

### グラフデータ
- [x] コントローラーで `current_user.contents.group(:media_type).count` でデータ取得
- [x] chartkick の `pie_chart` でレンダリング

### ゲスト制限
- [x] マイページの「編集」リンクをゲストユーザーに非表示
- [x] `RegistrationsController` の before_action でアクセスをブロック

### ナビゲーション
- [x] ヘッダーに「マイページ」リンクを追加（デスクトップ・モバイル両対応）

## 完了条件
- [x] マイページで種別割合グラフが表示される
- [x] 通常ユーザーはユーザー名・メールアドレス・パスワードを編集できる
- [x] ゲストユーザーは編集フォームにアクセスできない
