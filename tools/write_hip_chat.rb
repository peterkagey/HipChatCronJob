require 'net/http'
require 'json'
require 'openssl'

class WriteHipChat
  HEADER      = "--header 'Content-Type:application/json'"
  AUTH_TOKEN  = "?auth_token=" + ENV['HIPCHAT_AUTH_TOKEN']
  # http://stackoverflow.com/questions/610839/how-can-i-programmatically-create-a-new-cron-job

  def self.set_user_name(user_name)
    @user_name = user_name
  end

  def self.user_name
     (@user_name || ENV["HIPCHAT_RECIPIENT"]) || "@MichaelZemel"
  end

  def self.message_url
    "https://api.hipchat.com/v2/user/#{self.user_name}/message"
  end

  def self.send(message,user_name=nil)
    uri = URI.parse("#{self.message_url}#{AUTH_TOKEN}")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Post.new(uri.request_uri)
    request.add_field('Content-Type', 'application/json')
    request.body = {'message' => "#{message}"}.to_json
    puts "Attempting to send: '#{message}'"
    response = http.request(request)
    puts response.body ? response.body : "Message successfully sent!"
  end
end
