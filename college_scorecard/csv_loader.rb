require 'csv'
require_relative '2013_college_scorecards'

class CsvLoader

  def load_data(data)
    contents ||= CSV.open data, headers: true, header_converters: :symbol
    require "pry"
    binding.pry
    contents.to_a.map { |row| row.to_hash }
  end

end
