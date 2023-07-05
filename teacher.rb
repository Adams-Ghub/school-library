require './person'
class Teacher < Person
  attr_reader :specialization

  def initialize(name, age, specialization, id: rand(1..1000).to_i)
    super(name, age, id: id)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
