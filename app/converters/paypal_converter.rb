class PaypalConverter
  def self.convert(paypaldetails)
    {
      "recipient_name": paypaldetails.recipient_name,
      "username": paypaldetails.username,
      "email": paypaldetails.email,
      "mobile_number": paypaldetails.mobile_number
    }
  end
end