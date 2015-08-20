class HipChat
  COMMAND     = ""
  USER_NAME   = "@MichaelZemel"
  MESSAGE_URL = "https://api.hipchat.com/v2/user/#{USER_NAME}/message"
  HEADER      = "--header 'Content-Type:application/json'"
  JSON_PATH   = "#{Dir.pwd}/mzemel.json"
  AUTH_TOKEN  = "?auth_token=" + ENV['HIPCHAT_AUTH_TOKEN']
  # http://stackoverflow.com/questions/610839/how-can-i-programmatically-create-a-new-cron-job
  def self.send(message)
    puts `curl -X POST -d '{"message": "#{message}"}' #{MESSAGE_URL}#{AUTH_TOKEN} #{HEADER}`
  end
end

HipChat.send(ARGV.join(" "))
