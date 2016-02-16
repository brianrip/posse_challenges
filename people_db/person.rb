class Person
  attr_accessor :first_name, :last_name, :email, :state

  def initialize(attributes)
    @first_name = attributes[:first_name]
    @last_name  = attributes[:last_name]
    @email      = attributes[:email]
    @state      = attributes[:state]
  end
end
