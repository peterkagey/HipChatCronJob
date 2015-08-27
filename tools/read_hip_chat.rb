require 'json'
require 'time'
class ReadHipChat

  Message = Struct.new(:sender, :message, :datetime) {
    def datestring; datetime.strftime("20%y-%m-%d %H:%M:%S") end
    def to_s; "(#{datestring}) #{sender}: #{message}" end
    alias_method :inspect, :to_s
  }

  def initialize(number_of_messages = 20, user_name = "@MichaelZemel")
    @number_of_messages = number_of_messages
    @user_name = user_name
  end

  def inspect
    messages_list.map(&:to_s).join("\n")
  end
  alias_method :to_s, :inspect

  def messages_list
    parsed_messages.map do |msg|
      sender   = msg["from"]["name"]
      message  = msg["message"]
      datetime = Time.parse(msg["date"])
      Message.new(sender, message, datetime)
    end
  end

  private

  def message_history
    message_url = "https://api.hipchat.com/v2/user/#{@user_name}/history/latest"
    max_results = "max-results=#{@number_of_messages}"
    auth_token  = "auth_token=" + ENV['HIPCHAT_AUTH_TOKEN']
    @message_history ||= `curl '#{message_url}?#{max_results}&#{auth_token}'`
  end

  def parsed_messages
    @parsed_messages ||= JSON.parse(message_history)["items"]
  end

end
