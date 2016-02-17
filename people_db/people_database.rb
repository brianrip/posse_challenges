require_relative 'person'

class PeopleDatabase
  def initialize(people)
    @database = people
  end

  def add(data)
    @database << Person.new(data)
  end

  def remove(email)
    @database.delete_if do |data|
      data.email == email
    end
  end

  def find_by(state)
    @database.select do |data|
      data.state == state
    end
  end

  def where(email)
    @database.map do |data|
      data.email
    end.join(', ')
  end

  def count(state)
    @database.count do |data|
      data.state == state
    end
  end
end




if __FILE__ == $0
  people = []
  people_db = PeopleDatabase.new(people)
  people_db.add(first_name: "Tess", last_name: "Griffin", email: "tess@turing.io", state: "CO")
  people_db.add(first_name: "Tess", last_name: "Griffin", email: "BOSSS!", state: "CO")
  people_db.remove("tess@turing.io")
  # require 'pry' ; binding.pry
end
