require_relative 'person'

class PeopleDatabase
  def initialize(people)
    @database = people
  end

  def add(data)
    @database << Person.new(data)
    require 'pry' ; binding.pry
  end
end


if __FILE__ == $0
  people = []
  people_db = PeopleDatabase.new(people)
  people_db.add(first_name: "Tess", last_name: "Griffin", email: "tess@turing.io", state: "CO")
end
