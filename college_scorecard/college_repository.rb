# give us access to the Parser class in parser.rb
require_relative 'parser'

class CollegeRepository
  # a class method named data, called by `CollegeRepository.data`
  def self.data
    filepath = File.expand_path("2013_college_scorecards.csv") # basically: "give me the full path for this file"
    
    Parser.from_csv(filepath) # call the from_csv method on the Parser class, and pass in the filepath variable
  end
end
