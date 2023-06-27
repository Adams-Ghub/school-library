require './person'
class Teacher < Person
  def initialize(_name, age, spcialization, id: rand)
    super('unknown', age, id: id)
    @specialization = spcialization
  end

  def can_use_services?
    true
  end
end
