require_relative 'parser'

class CollegeRepository
  def self.data
    filepath = File.expand_path("2013_college_scorecards.csv")
    Parser.from_csv(filepath)
  end
end
