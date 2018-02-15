module SmsTool
  account_sid = ENV['TWILIO_ACCOUNT_SID']
  auth_token = ENV['TWILIO_AUTH_TOKEN']

  @client = Twilio::REST::Client.new account_sid, auth_token

  def self.send_sms(number: , message:)
    puts ENV["TWILIO_PHONE_NUMBER"]
    @client.messages.create( 
      
      body: "#{message}",
      to: "+1#{number}",
      # from: ENV["TWILIO_PHONE_NUMBER"]
      from: '+15005550006'
    )
  end
end
