class CronJobAdder

  def self.add(time_string, path)
    home = ENV["HOME"]
    validate_time_string(time_string)
    validate_path(path)
    mumbo_jumbo_suffix = '2>&1 | grep -v "no crontab" | sort | uniq | crontab -'
    command = "#{time_string} source #{home}/.bash_profile; ruby '#{path}'"

    `(crontab -l ; echo "#{command}") #{mumbo_jumbo_suffix}`
  end

  private

  def self.validate_time_string(time_string)
    return if time_string =~ /(\*|\d+) (\*|\d+) (\*|\d+) (\*|\d+) (\*|[\d-]+)/
    raise "Unknown format: (#{time_string})."
  end

  def self.validate_path(path)
    return if path.strip[-3..-1] == ".rb"
    raise "The second argument doesn't look like a ruby file! (#{path})"
  end

end

CronJobAdder.add(ARGV[0], ARGV[1])
