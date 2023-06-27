require './person'
class Teacher < Person
  def initialize(_spcialization)
    super(name, age, parent_permission)
  end

  def can_use_services?
    true
  end
end
