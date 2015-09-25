require_relative '../tools/read_hip_chat'

require 'optparse'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: example.rb [options]"

  opts.on('-n', '--username NAME', 'Specify a user name') { |v| options[:user_name] = v }
  opts.on('-m', '--messages NUMBER', 'Specify a number of messages') { |v| options[:messages] = v }

end.parse!

user_name = options[:user_name]
messages  = options[:messages]

if user_name && messages
  puts ReadHipChat.new(messages,user_name)
else
  puts "Using Defaults! Be sure to use '-n' to specify user name and '-m' to specify number of messages\n"
  puts ReadHipChat.new
end
