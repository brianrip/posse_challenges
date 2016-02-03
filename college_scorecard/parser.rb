# require the csv...module?
require 'csv'

class Parser
  # another class method (`Parser.from_csv`)
  def self.from_csv(filepath)
    # read the csv file
    CSV.read(filepath, headers: true, header_converters: :symbol)
       .map { |r| r.to_h } # create an array of the rows as hashes
  end
end
