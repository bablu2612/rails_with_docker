class ChannelConverter
  def self.convert(channel, user)
    {
      "id": channel.id.to_s,
      "name": channel.name,
      "description": channel.description,
      "category_ids": channel.categories.map { |c| c.id } || [],
      "cover": {
        "image_url": channel.cover_details[:url],
        "height": channel.cover_details[:height],
        "width": channel.cover_details[:width]
      },
      "thumbnail": {
        "image_url": channel.thumbnail_details[:url],
        "height": channel.thumbnail_details[:height],
        "width": channel.thumbnail_details[:width]
      },
      "video_engagements": {
          "total_likes": channel.total_likes,
          "total_comments": channel.total_comments,
          "total_views": channel.total_views
        },
      "engagements": {
        "total_subscribers": channel.subscriptions.count,
        "subscribed": user ? user.has_active_subscription_for?(channel) : false,
      },
      "subscription_price": channel.price,
      "creator_type": "content_creator"
    }
  end
end