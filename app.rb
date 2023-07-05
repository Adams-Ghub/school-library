require './modules/book_module'
require './modules/person_module'
require './modules/rental_module'
require './book'
require './save_data'
require 'json'

class App
 
  def initialize
    @books = []
    @students = []
    @teachers = []
    load_data.to_s
  end

  # def save_data
  #   save_json('books.json',@books)
  #   save_json('students.json',@students)
  #   save_json('teachers.json',@teachers)
  # end
  
  def filter_data(data)
    data.each do |element|
      if element.include?('classroom')
        student = Student.new(element[:classroom], element[:age], element[:name], element[:parent_permission])
        @students.push(student)
      else
        teacher = Teacher.new(element[:name], element[:age], element[:specialization])
        @teachers.push(teacher)
      end
    end
  end
  

  # def load_data
  #   @books=load_json('books.json') || []
  #  filter_data(load_json('person.json')||[])
  #   @rental=load_json('rental.json') || []
  # end

  def save_json(filename, data)
    new_data = data.map(&:to_json)
    File.open(filename, 'w'){ |element|
      element.write(JSON.generate(data))}    
    
  end

  def load_data
    if File.exist?('books.json')
      book_data = JSON.parse(File.read('books.json'), symbolize_names: true)
      @books = book_data.map { |book| Book.new(book[:title], book[:author]) }
    else
      @books = []
    end
  
    if File.exist?('person.json')
      data = JSON.parse(File.read('person.json'), symbolize_names: true)
      filter_data(data)
     # @teachers.map! { |teacher_data| Teacher.new(teacher_data[:age], teacher_data[:name], teacher_data[:specialization]) }
     # @students.map! { |student_data| Student.new(student_data[:classroom], student_data[:age], student_data[:name], student_data[:parent_permission]) }
    else
      @students = []
      @teachers = []
    end    
  
    if File.exist?('rental.json')
      @rental = JSON.parse(File.read('rental.json'), symbolize_names: true)
    else
      @rental = []
    end
  end

  # def load_json(filename)
  #   if File.exist?(filename) 
  #     file = File.read(filename)
  #     JSON.parse(file, symbolize_names: true)
  #   end
  #   nil
  # end

  include BOOK
  include PERSON
  include RENTAL
  include SAVEDATA
end
