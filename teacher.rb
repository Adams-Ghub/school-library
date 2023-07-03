require './person'
class Teacher < Person
  def initialize(name, age, spcialization, id: rand(1..1000).to_i)
    super(name, age, id: id)
    @specialization = spcialization
  end

  def can_use_services?
    true
  end
end
