require 'net/http'
require 'json'
require 'openssl'

class WriteToRoom
  HEADER      = "--header 'Content-Type:application/json'"
  AUTH_TOKEN  = "?auth_token=" + ENV['HIPCHAT_AUTH_TOKEN']
  # http://stackoverflow.com/questions/610839/how-can-i-programmatically-create-a-new-cron-job

  def initialize(room_id, attendees=nil)
    @room_id = room_id
    @attendees = attendees
  end

  def attendees
    @attendees ||= ["@AlanShields",
                    "@bar",
                    "@BrandonSanders",
                    "@DanWiedeback",
                    "@JamieBarmettler",
                    "@JeffreyBaird",
                    "@JoshBremer",
                    "@JustinSchumacher",
                    "@randie",
                    "@RyanMcCarthy",
                    "@ScottEissfeldt",
                    "@ShaunWinters",
                    "@PeterKagey",
                    "@LucasHill",
                    "@MatthewPhillips"]
  end

  def choose_attendee
    puts "hi"
    attendees.shuffle.pop
  end
  #
  # def set_room_name(room_id)
  #   @room_id = room_id
  # end

  def room_id
     (@room_id || ENV["HIPCHAT_ROOM_DEFAULT"]) || "708569"
  end

  def message_url
    "https://api.hipchat.com/v2/room/#{room_id}/message"
  end

  def send(message,room_id=nil)
    uri = URI.parse("#{self.message_url}#{AUTH_TOKEN}")
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
