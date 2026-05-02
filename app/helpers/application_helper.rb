module ApplicationHelper
  MEDIA_TYPE_LABELS = {
    "book"    => "本",
    "youtube" => "YouTube",
    "video"   => "動画配信",
    "article" => "記事",
    "other"   => "その他"
  }.freeze

  MEDIA_TYPE_BADGE_CLASSES = {
    "book"    => "bg-amber-50 text-amber-700",
    "youtube" => "bg-red-50 text-red-600",
    "video"   => "bg-purple-50 text-purple-700",
    "article" => "bg-sky-50 text-sky-700",
    "other"   => "bg-gray-100 text-gray-600"
  }.freeze

  def t_media_type(media_type)
    MEDIA_TYPE_LABELS.fetch(media_type, media_type)
  end

  def media_type_badge_class(media_type)
    MEDIA_TYPE_BADGE_CLASSES.fetch(media_type, "bg-gray-100 text-gray-600")
  end
end
