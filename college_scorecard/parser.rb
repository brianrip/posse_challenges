require 'csv'

class Parser
  def self.from_csv(filepath)
    CSV.read(filepath, headers: true, header_converters: :symbol).map { |r| r.to_h }
  end
end
