class Content < ApplicationRecord
  belongs_to :user

  MEDIA_TYPES = %w[book youtube video article other].freeze

  enum :status, { unread: 0, done: 1 }

  validates :title, presence: true, length: { maximum: 255 }
  validates :url, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]), message: "は正しいURL形式で入力してください" }, allow_blank: true
  validates :media_type, presence: true, inclusion: { in: MEDIA_TYPES }
  validates :status, presence: true
  validates :rating, numericality: { only_integer: true, in: 1..5 }, allow_nil: true

  validate :rating_only_when_done

  private

  def rating_only_when_done
    errors.add(:rating, "は消化済み時のみ入力できます") if rating.present? && unread?
  end
end
