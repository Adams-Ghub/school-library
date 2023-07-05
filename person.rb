require './nameable'
require './decorator'

class Person < Nameable
  def initialize(name = 'unknown', age = 0, id: rand(1..1000).to_i)
    super()
    @id = id
    @name = name
    @age = age
    @rental = []
  end

  attr_reader :id
  attr_accessor :name, :age, :rental

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(rental)
    @rental << rental
    rental.person = self
  end

  private

  def of_age?
    @age >= 18
  end
end
