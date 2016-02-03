# require the csv...module?
require 'csv'

class Parser
  # another class method (`Parser.from_csv`)
  def self.from_csv(filepath)
    CSV.read(filepath, headers: true, header_converters: :symbol)
       .map { |r| r.to_h }
  end
end
