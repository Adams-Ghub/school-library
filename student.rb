require './person'
class Student < Person
  attr_reader :classroom, :name, :parent_permission, :rental, :age

  def initialize(classroom, name, age, parent_permission, id: rand(1..1000).to_i)
    super(age, name, id: id)
    @classroom = classroom
    @parent_permission = parent_permission
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
