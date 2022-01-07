class User < ApplicationRecord
    has_one_attached:image

#     def as_json(options={})
#     user_data={"image_url": self.image}
#     user_data
#   end
def get_image_url
    url_for(self.image)
  end
end
