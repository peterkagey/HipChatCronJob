require 'json'
class WriteHipChat
  USER_NAME   = ENV["HIPCHAT_RECIPIENT"] || "@MichaelZemel"
  MESSAGE_URL = "https://api.hipchat.com/v2/user/#{USER_NAME}/message"
  HEADER      = "--header 'Content-Type:application/json'"
  AUTH_TOKEN  = "?auth_token=" + ENV['HIPCHAT_AUTH_TOKEN']
  # http://stackoverflow.com/questions/610839/how-can-i-programmatically-create-a-new-cron-job
  def self.send(message)
    puts jsonify = {"message" => "#{message}"}.to_json.inspect
    puts`curl -X POST -d #{jsonify} #{MESSAGE_URL}#{AUTH_TOKEN} #{HEADER}`
  end
end
