require_relative "../tools/write_hip_chat"
class NextHoliday
  HOLIDAYS = {
    Time.new(2015,8,26,23,59)   => "Women's Equality Day",
    Time.new(2015,8,27,23,59)   => "Lyndon Baines Johnson Day",
    Time.new(2015,9,7,23,59)    => "Labor Day",
    Time.new(2015,9,9,23,59)    => "California Admission Day",
    Time.new(2015,9,11,23,59)   => "Patriot Day",
    Time.new(2015,9,12,23,59)   => "Carl Garner Federal Lands Cleanup Day",
    Time.new(2015,9,13,23,59)   => "National Grandparents Day",
    Time.new(2015,9,14,23,59)   => "Rosh Hashana",
    Time.new(2015,9,17,23,59)   => "Constitution Day and Citizenship Day",
    Time.new(2015,9,18,23,59)   => "National POW/MIA Recognition Day",
    Time.new(2015,9,22,23,59)   => "Emancipation Day",
    Time.new(2015,9,23,23,59)   => "Yom Kippur",
    Time.new(2015,9,24,23,59)   => "Eid al-Adha",
    Time.new(2015,9,25,23,59)   => "Native Americans' Day",
    Time.new(2015,9,27,23,59)   => "Gold Star Mother's Day",
    Time.new(2015,9,28,23,59)   => "First Day of Sukkot",
    Time.new(2015,10,4,23,59)   => "Feast of St Francis of Assisi",
    Time.new(2015,10,5,23,59)   => "Shmini Atzeret",
    Time.new(2015,10,6,23,59)   => "Simchat Torah",
    Time.new(2015,10,9,23,59)   => "Leif Erikson Day",
    Time.new(2015,10,12,23,59)  => "Indigenous People's Day",
    Time.new(2015,10,13,23,59)  => "Navy Birthday",
    Time.new(2015,10,15,23,59)  => "White Cane Safety Day",
    Time.new(2015,10,16,23,59)  => "Boss's Day",
    Time.new(2015,10,18,23,59)  => "Alaska Day",
    Time.new(2015,10,19,23,59)  => "Alaska Day observed",
    Time.new(2015,10,30,23,59)  => "Nevada Day",
    Time.new(2015,10,31,23,59)  => "Halloween",
    Time.new(2015,11,1,23,59)   => "All Saints' Day",
    Time.new(2015,11,2,23,59)   => "All Souls' Day",
    Time.new(2015,11,3,23,59)   => "Election Day",
    Time.new(2015,11,10,23,59)  => "Marine Corps Birthday",
    Time.new(2015,11,11,23,59)  => "Veterans Day",
    Time.new(2015,11,26,23,59)  => "Thanksgiving Day",
    Time.new(2015,11,27,23,59)  => "Robert E Lee's Birthday",
    Time.new(2015,11,27,23,59)  => "Black Friday",
    Time.new(2015,11,29,23,59)  => "First Sunday of Advent",
    Time.new(2015,11,30,23,59)  => "Cyber Monday",
    Time.new(2015,12,6,23,59)   => "St Nicholas' Day",
    Time.new(2015,12,7,23,59)   => "Chanukah/Hanukkah (first day)",
    Time.new(2015,12,8,23,59)   => "Feast of the Immaculate Conception",
    Time.new(2015,12,12,23,59)  => "Feast of Our Lady of Guadalupe",
    Time.new(2015,12,14,23,59)  => "Last Day of Chanukah",
    Time.new(2015,12,22,23,59)  => "December Solstice",
    Time.new(2015,12,24,23,59)  => "The Prophet's Birthday",
    Time.new(2015,12,25,23,59)  => "Christmas Day",
    Time.new(2015,12,26,23,59)  => "Kwanzaa (until Jan 1)",
    Time.new(2015,12,26,23,59)  => "Day After Christmas Day",
    Time.new(2015,12,31,23,59)  => "New Year's Eve",
    Time.new(2016,12,31,23,59)  => "time to update your script"
  }

  SECONDS_IN_A_DAY = 3600 * 24

  def initialize
    @holidate, @holiday = HOLIDAYS.find { |date, _| date > Time.now }
  end

  def days_to_go
    days = (@holidate - Time.now)/SECONDS_IN_A_DAY
    days.to_i
  end

  def hipchat
    case days_to_go
    when 0 then "Did you realize that it's #{@holiday} today?"
    when 1 then "Did you notice that it's #{@holiday} tomorrow?"
    else
      "Did you know that it's #{@holiday} in #{days_to_go} days?"
    end
  end

end

WriteHipChat.send(NextHoliday.new.hipchat)
