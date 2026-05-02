class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:top]

  def top
    # ログイン済みの場合はコンテンツ一覧へ（チケット04でルート追加後に有効化）
    # redirect_to contents_path if user_signed_in?
  end
end
