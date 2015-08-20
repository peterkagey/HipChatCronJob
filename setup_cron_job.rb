class CronJob
  USER_NAME   = "@MichaelZemel"
  MESSAGE_URL = "https://api.hipchat.com/v2/user/#{USER_NAME}/message"
  HEADER      = "'Content-Type:application/json'"
  CRON_TIME   = "0 14 * * *"
  JSON_PATH   = "#{Dir.pwd}/mzemel.json"
  AUTH_TOKEN  = ENV['HIPCHAT_AUTH_TOKEN']
  # http://stackoverflow.com/questions/610839/how-can-i-programmatically-create-a-new-cron-job
  def self.append_job
    puts `(crontab -l ; echo "#{CRON_TIME} curl -X POST -d @#{JSON_PATH} #{MESSAGE_URL}?auth_token=#{AUTH_TOKEN} --header #{HEADER}") 2>&1 | grep -v "no crontab" | sort | uniq | crontab -`
  end
end

CronJob.append_cron_job
