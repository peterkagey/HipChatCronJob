require_relative '../tools/write_to_room'
require 'optparse'


options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: cli/who_buys_lunch.rb -n jeffreybaird -e 'jeffrey alan matthew'"

  opts.on('-n', '--username NAME', 'Specify a user name') { |v| options[:user_name] = v }

  opts.on('-r', '--room ROOMID', 'Specify a room to post in') { |v| options[:room] = v }

  opts.on('-e', '--attendees NAMES', 'Specify users to choose from') { |v| options[:attendees] = v }

end.parse!

room = options[:room]
users = options[:attendees].split(" ") if options[:attendees]

w = WriteToRoom.new(room,users)

w.send("The person who is buying lunch today is: #{w.choose_attendee}")
