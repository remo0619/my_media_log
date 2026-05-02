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

  # フィールドエラーをインライン表示するヘルパー
  def inline_error(object, field)
    messages = object.errors.full_messages_for(field)
    return if messages.empty?

    content_tag(:p, messages.first, class: "text-red-500 text-xs mt-1")
  end

  # エラーがあるフィールドに赤ボーダーを適用するヘルパー
  def input_class(object, field, extra: "")
    base = "w-full rounded px-3 py-2 text-sm focus:outline-none focus:ring-2 #{extra}"
    if object.errors[field].any?
      "#{base} border border-red-400 focus:ring-red-400"
    else
      "#{base} border border-gray-300 focus:ring-indigo-500"
    end
  end

  def t_media_type(media_type)
    MEDIA_TYPE_LABELS.fetch(media_type, media_type)
  end

  def media_type_badge_class(media_type)
    MEDIA_TYPE_BADGE_CLASSES.fetch(media_type, "bg-gray-100 text-gray-600")
  end

  def safe_external_url(url)
    return nil if url.blank?
    uri = URI.parse(url)
    %w[http https].include?(uri.scheme) ? url : nil
  rescue URI::InvalidURIError
    nil
  end
end
