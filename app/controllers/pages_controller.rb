class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :top ]

  def top
    redirect_to contents_path if user_signed_in?
  end
end
