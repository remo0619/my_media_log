module ApplicationHelper
  MEDIA_TYPE_LABELS = {
    "book"    => "本",
    "youtube" => "YouTube",
    "video"   => "動画配信",
    "article" => "記事",
    "other"   => "その他"
  }.freeze

  def t_media_type(media_type)
    MEDIA_TYPE_LABELS.fetch(media_type, media_type)
  end
end
