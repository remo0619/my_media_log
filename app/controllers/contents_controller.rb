class ContentsController < ApplicationController
  before_action :set_content, only: [ :show, :edit, :update, :destroy, :toggle_status ]
  before_action :authorize_content!, only: [ :show, :edit, :update, :destroy, :toggle_status ]

  def index
    @contents = current_user.contents
                             .by_media_type(params[:media_type])
                             .by_status(params[:status])
                             .search_title(params[:q])
                             .order(created_at: :desc)
                             .page(params[:page]).per(20)
  end

  def show
  end

  def new
    @content = current_user.contents.build
  end

  def create
    @content = current_user.contents.build(content_params)
    if @content.save
      redirect_to @content, notice: "コンテンツを登録しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @content.update(content_params)
      redirect_to @content, notice: "コンテンツを更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @content.destroy
    redirect_to contents_path, notice: "コンテンツを削除しました"
  end

  def toggle_status
    if @content.unread?
      @content.update!(status: :done)
      notice = "消化済みにしました"
    else
      @content.update!(status: :unread, rating: nil)
      notice = "未消化に戻しました"
    end
    redirect_back fallback_location: content_path(@content), notice: notice
  end

  private

  def set_content
    @content = Content.find(params[:id])
  end

  def authorize_content!
    raise ActiveRecord::RecordNotFound unless @content.user == current_user
  end

  def content_params
    params.require(:content).permit(:title, :url, :media_type, :status, :rating, :memo)
  end
end
