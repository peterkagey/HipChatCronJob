require 'json'

class HipChat
  AUTH_TOKEN  = "&auth_token=" + ENV['HIPCHAT_AUTH_TOKEN']

  def initialize(number_of_messages = 20, user_name = "@MichaelZemel")
    @number_of_messages = number_of_messages
    @user_name = user_name
    get_message_history
    parse_messages
  end

  def message_url
    "https://api.hipchat.com/v2/user/#{@user_name}/history/latest"
  end

  def max_results
    "?max-results=#{@number_of_messages}"
  end

  def get_message_history
    @message_history ||= `curl '#{message_url}#{max_results}#{AUTH_TOKEN}'`
  end

  def parse_messages
    @parsed_messages = JSON.parse(@message_history)["items"]
  end

  def inspect
    "\n" + @parsed_messages.map { |message| format(message) }.join("\n")
  end

  alias_method :to_s, :inspect

  def format(message)
    message["from"]["name"] + ": " + message["message"]
  end
end

p HipChat.new
