require_relative 'college_repository'

class CollegeScoreboard
  def initialize
    @data ||= CollegeRepository.data
  end

  def start(fn_name, arg)
    send(fn_name.to_sym, arg)
  end

  def by_state(state)
    @data.reduce([]) do |colleges_in_state, college_data|
      if college_data[:stabbr] == state
        colleges_in_state.push(college_data[:instnm])
      end
      colleges_in_state
    end
  end

  def top_average_faculty_salary(num)
    @data.select { |college_data| college_data[:avgfacsal] != "NULL" }
    .sort_by { |college_data| college_data[:avgfacsal] }
    .map { |college_data| college_data[:instnm] }
    .first(num.to_i)
  end
end






puts CollegeScoreboard.new.start(ARGV[0], ARGV[1])
