require './rental'
require './person'
require 'date'

module RENTAL
    def enter_date
        loop do
            puts 'Please enter date (YYYY-MM-DD):'
            entered_date = gets.chomp
            if entered_date.match(/^\d{4}-\d{2}-\d{2}$/) 
                begin
                    return Date.parse(entered_date)
                  rescue ArgumentError
                    puts 'Invalid date.'
                  end              
            else
                puts 'Date format is invalid. Try again'
            end
        end
    end

    def select_person(people)
        id_input=nil        
        loop do
            puts 'Enter valid person ID'
            id_input = gets.chomp.to_i     
            
            break unless people[id_input].nil?
            end
        people[id_input]
    end

    def list_rental_per_person
        people = @students + @teachers

        person = select_person(people)
        puts "All #{person.name}'s Rentals:" unless person.rental.empty?
        person.rental.each do |specific|
            puts "Date: #{specific.date}, Book: #{specific.book.title} by Author: #{specific.book.author}"
        end
        
    end
    
    def show_person_details
        person_id =0
        people = @students + @teachers
        loop do 
            puts "Select a person by index"
            
            people.each_with_index do |person, index|
                puts "#{index}) [#{person.class}] Name: #{person.name} Age:#{person.age}"
            end
            puts "Select person"
            person_id=gets.chomp.to_i
            break unless people[person_id].nil?
        end
        people[person_id]
    end 

    def show_books_details
        book_id=0
        loop do 
            puts "Select a book by index to display its details"
            
            @books.each_with_index do |book, index|
                puts "#{index}) Title: #{book.title}, Author: #{book.author}"
            end
            puts "Your input:"
            book_id = gets.chomp.to_i
            break unless @books[book_id].nil?
        end
        @books[book_id]
    end

    def create_rental
        puts "Creating new rentals"
        person = show_person_details
        book = show_books_details
        date = enter_date
        rental = Rental.new(date, person, book)     
        person.add_rental(rental)
        puts "Rental created successfully"
    end
end