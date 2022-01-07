class VideoConverter
  def self.convert(video, user)
    {
      "id": video.id.to_s,
      "duration": video.duration.to_i,
      "created_at": video.created_at,
      "updated_at": video.updated_at,
      "title": video.title,
      "content": video.description,
      "feed_id": video.channel_id,
      "category": video.category.id,
      "category_id": video.category.id,
      "tags": video.taggings.map { |t| t.tag },
      "clips": video.clips.map do |c|
        {
          "id": c.id.to_s,
          "created_at":c.created_at,
          "updated_at":c.updated_at,
          "aspect_ratio":c.aspect_ratio,
          "url": c.url
        }
        end,
      "thumbnails": video.thumbnails.map do |t|
        {
          "id": t.id.to_s,
          "created_at":t.created_at,
          "updated_at":t.updated_at,
          "aspect_ratio":t.aspect_ratio,
          "url": t.url
        }
      end,
      "engagements": {
        "total_likes": video.total_likes,
        "liked": user ? user.liked?(video) : false,
        "total_views": video.total_views,
        "viewed": user ? user.viewed?(video) : false,
        "total_comments": video.total_comments
      },
      "channel": {
        "id": video.channel.id.to_s,
        "name": video.channel.name,
        "description": video.channel.description,
        "cover": {
          "image_url": video.channel.cover_details[:url],
          "height": video.channel.cover_details[:height],
          "width": video.channel.cover_details[:width]
        },
        "thumbnail": {
          "image_url": video.channel.thumbnail_details[:url],
          "height": video.channel.thumbnail_details[:height],
          "width": video.channel.thumbnail_details[:width]
        },
        "engagements": {
          "total_subscribers": video.channel.subscriptions.count,
          "subscribed": user ? user.has_active_subscription_for?(video.channel) : false,
        },
        "subscription_price": video.channel.price,
        "creator_type": ""
      },
      "creator_type": "content_creator",
    }
  end
end