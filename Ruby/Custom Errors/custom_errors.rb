class PartnerError < StandardError
  def message 
    "you must give the get_married method an argument of an instance of the person class!"
  end

end

class Person
  attr_accessor :partner, :name

  def initialize(name)
    @name = name
  end

  def get_married(person)
    # raise PartnerError if person.class != Person
    # Above code will cause raise error with message INSIDE error
    if person.class != Person
      begin
        raise PartnerError
      rescue PartnerError => error
          puts error.message
      end
    else
      person.partner = self
    end
    # If "person" variable is not an instance of the "Person" class, a message will appear INSTEAD of an error (rescue statement)
  end

end

beyonce = Person.new("Beyonce")
beyonce.get_married("Jay-Z")
puts beyonce.name






