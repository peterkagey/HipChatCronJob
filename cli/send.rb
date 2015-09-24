require_relative '../tools/write_hip_chat'
require 'optparse'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: example.rb [options]"

  opts.on('-n', '--username NAME', 'Specify a user name') { |v| options[:user_name] = v }

end.parse!

user_name = options[:user_name]

if user_name
  WriteHipChat.set_user_name(user_name)
end

WriteHipChat.send(ARGV.join(" "))
