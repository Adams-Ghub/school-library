class Rental
  attr_accessor :date
  attr_reader :person, :book

  def initialize(date, person, book)
    @date = date
    @person = person
    person.rental << self unless person.rental.include?(self)
    @book = book
    book.rental << self unless book.rental.include?(self)
  end
end
