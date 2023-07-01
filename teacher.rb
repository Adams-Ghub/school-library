require './person'
class Teacher < Person
  def initialize(name, age, spcialization, id: rand)
    super(name, age, id: id)
    @specialization = spcialization
  end

  def can_use_services?
    true
  end
end
