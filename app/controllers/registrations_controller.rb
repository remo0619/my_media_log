class RegistrationsController < Devise::RegistrationsController
  before_action :reject_guest_user!, only: [ :edit, :update ]

  private

  def reject_guest_user!
    if current_user.guest?
      redirect_to contents_path, alert: "ゲストユーザーはプロフィールを編集できません"
    end
  end
end
