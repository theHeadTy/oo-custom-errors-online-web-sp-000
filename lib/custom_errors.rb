class PartnerError < StandardError
  def message
    "you must give the get_married method an argument of an instance of the person class!"
  end
end


class Person
  
  PartnerError = Class.new(PartnerError)
  
  attr_accessor :partner, :name

  def initialize(name)
    @name = name
  end

  def get_married(person)
    self.partner = person
    if person.kind_of? Person
      person.partner = self
    else
      begin
        raise PartnerError
        rescue PartnerError => error
        puts error.message
      end
    end
  end

end

beyonce = Person.new("Beyonce")
beyonce.get_married("Jay-Z")
puts beyonce.name




