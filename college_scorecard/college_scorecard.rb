require_relative 'parser'
require 'pry'

class CollegeScoreboard
  def initialize(data)
    @data = data
  end

  def start(fn_name, arg)
    case fn_name
    when "by_state" then by_state(arg)
    end
  end

  def by_state(state)
    @data.reduce([]) do |colleges_in_state, college_data|
      if college_data[:stabbr] == state
        colleges_in_state.push(college_data[:instnm])
      end
      colleges_in_state
    end
  end
end



filepath = File.expand_path("2013_college_scorecards.csv")
data = Parser.from_csv(filepath)

puts CollegeScoreboard.new(data).start(ARGV[0], ARGV[1])
