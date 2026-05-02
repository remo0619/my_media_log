class MypagesController < ApplicationController
  def show
    @chart_data = current_user.contents
                               .group(:media_type)
                               .count
                               .transform_keys { |k| ApplicationHelper::MEDIA_TYPE_LABELS.fetch(k, k) }
  end
end
