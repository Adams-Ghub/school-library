require './person'
class Student < Person
  attr_reader :classroom

  def initialize(classroom, age, name, parent_permission, id: rand)
    super(age, name, id: id)
    @classroom = classroom
    @parent_permission=parent_permission
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
