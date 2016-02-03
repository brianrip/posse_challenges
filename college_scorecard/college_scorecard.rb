# give us access to the CollegeRepository class from college_repository.rb
require_relative 'college_repository'

class CollegeScoreboard
  def initialize # <- when we call `CollegeScoreboard.new` (creates a new instance of this class)

    # 'memoize' the csv data - basically: "create this variable, but since it takes a while, check to see if we've already created it, and if so, use that one."
    @data ||= CollegeRepository.data
  end

  def start(fn_name, arg)
    #       ^function name, argument for that function
    send(fn_name.to_sym, arg) # probably don't use this....   :-O  !!!!
    #     ^call the function name passed in, and pass it the argument
  end

  def by_state(state)
    # access the @data instance variable (this is the parsed csv data)
    @data.reduce([]) do |colleges_in_state, college_data| # reduce the data to an array (named colleges_in_state locally)

      if college_data[:stabbr] == state # if the "stabbr" value is equal to the state string passed into this method...

        # ...then add the college name (college_data[:instnm] in our data) to the colleges_in_state array.
        colleges_in_state.push(college_data[:instnm])
      end

      colleges_in_state # return this array at the end of the loop each time.
    end
  end


end

# when this file is run:
# 1) create a new instance of CollegeScoreboard
# 2) call the `start` method on that instance
# 3) pass it the arguments inputted in the command line

puts CollegeScoreboard.new.start(ARGV[0], ARGV[1])

# $ <- means a command in the command line
# e.g. `$ ruby college_scorecard.rb by_state AK`

# ARGV[0] => "by_state"
# ARGV[1] => "AK"
