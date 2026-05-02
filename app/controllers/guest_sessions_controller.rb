class GuestSessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    guest = User.guest
    sign_in guest
    redirect_to contents_path, notice: "ゲストユーザーとしてログインしました"
  end
end
