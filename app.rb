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
            @students.push(element)          
            else
            @teachers.push(element)
        end
      end
  end

  def load_data
    @books=load_json('books.json') || []
   filter_data(load_json('person.json')||[])
    @rental=load_json('rental.json') || []
  end

  def save_json(filename, data)
    new_data = data.map(&:to_json)
    File.open(filename, 'w'){ |element|
      element.write(JSON.generate(data))}    
    
  end

  def load_json(filename)
    if File.exist?(filename) 
      file = File.read(filename)
      JSON.parse(file, symbolize_names: true)
    end
    nil
  end

  include BOOK
  include PERSON
  include RENTAL
  include SAVEDATA
end
