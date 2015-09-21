require 'net/http'
require 'json'
require 'openssl'

class WriteHipChat
  USER_NAME   = ENV["HIPCHAT_RECIPIENT"] || "@MichaelZemel"
  MESSAGE_URL = "https://api.hipchat.com/v2/user/#{USER_NAME}/message"
  HEADER      = "--header 'Content-Type:application/json'"
  AUTH_TOKEN  = "?auth_token=" + ENV['HIPCHAT_AUTH_TOKEN']
  # http://stackoverflow.com/questions/610839/how-can-i-programmatically-create-a-new-cron-job

  def self.send(message)
    uri = URI.parse("#{MESSAGE_URL}#{AUTH_TOKEN}")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Post.new(uri.request_uri)
    request.add_field('Content-Type', 'application/json')
    request.body = {'message' => "#{message}"}.to_json
    puts request.body
    http.request(request)
  end
end
