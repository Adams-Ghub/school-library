require './person'
class Student < Person
attr_accessor :classroom

  def initialize(classroom, age, name, parent_permission, id: rand)
    super(age, name, parent_permission, id: id)
    @classroom = classroom
  end

  def classroom(classroom)
    @classroom=classroom
    classroom.students << self unless classroom.students.include?(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
