require_relative "../tools/read_hip_chat"
require_relative "../tools/write_hip_chat"

class ReplyToMichael
  def initialize
    @message_list = ReadHipChat.new.messages_list.reverse
  end

  def target_message
    @message_list.find do |m|
      m.sender =~ /Michael/ &&
      matching_text(m) &&
      (Time.now - m.datetime) < 300
    end
  end

  def matching_text(chat)
    chat.message.match(/Can you believe it's already (.+)\?/)
  end

  def claimed_day
    match = matching_text(target_message) unless target_message.nil?
    match[1] if match
  end

  def response
    actual_day = Time.now.strftime("%A")
    return if claimed_day.nil?

    if claimed_day == actual_day
      "I can believe it! Today is the epitome of a #{claimed_day}!"
    else
      "It doesn't feel like a #{claimed_day}; it feels like a #{actual_day}"
    end
  end
end

response = ReplyToMichael.new.response
WriteHipChat.send(response) if response
