class UsersConverter
  def self.convert(user_details,request)
    {
      "user_name": user_details.name,
      "email": user_details.email,
      "Phone_no": user_details.phone_no,
      "image_url": request.protocol + request.host + Rails.application.routes.url_helpers.rails_blob_url(user_details.image,disposition: "attachment", only_path: true)
    }
  end
  
end