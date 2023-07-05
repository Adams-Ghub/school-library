require 'json'

module SAVEDATA
  def save_books
    new_book = []
    @books.each do |book|
      select = {
        title: book.title,
        author: book.author
      }
      new_book.push(select)
    end
    save_json('books.json', new_book)
  end

  def save_rental
    new_rental = []
    person = @students.concat(@teachers)
    person.each do |element|
      element.rental.each do |rental|
        select = {
          id: element.id,
          book: { title: rental.book.title, book: rental.book.author },
          date: rental.date
        }
        new_rental.push(select)
      end
    end
    save_json('rentals.json', new_rental)
  end

  def save_person
    people = []
    @students.each do |student|
      select = {
        id: student.id,
        name: student.name,
        age: student.age
      }

      select[:classroom] = student.classroom if student.is_a?(Student)
      select[:parent_permission] = student.parent_permission if student.is_a?(Student)

      people.push(select)
    end
    @teachers.each do |teacher|
      select = {
        id: teacher.id,
        name: teacher.name,
        age: teacher.age,
        specialization: teacher.specialization
      }
      people.push(select)
    end
    save_json('person.json', people)
  end

  # def load_data
  #   @books = load_json('books.json') || []
  #   @students = load_json('students.json') || []
  #   @teachers = load_json('teachers.json') || []
  #   @rental = load_json('rental.json') || []
  # end

  def save_json(filename, data)
    data.map(&:to_json)
    File.open(filename, 'a') do |element|
      element.write(JSON.generate(data))
    end
  end

  # def load_json(filename)
  #   if File.exist?(filename)
  #     file = File.read(filename)
  #     JSON.parse(file, symbolize_names: true)
  #   end
  #   nil
  # end
end
