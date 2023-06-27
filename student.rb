require './person'
class Student < Person
  def initialize(classroom, age, name, parent_permission, id: rand)
    super(age, name, parent_permission, id: id)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
