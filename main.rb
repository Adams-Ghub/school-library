require './app'

    def display_menu
        puts 'Please choose an option by entering a number:'
        puts '1. List all books'
        puts '2. List all people'
        puts '3. Create a person'
        puts '4. Create a book'
        puts '5. Create a rental'
        puts '6. List all rentals for a given person id'
        puts '7. Exit'
        print 'Your input: '
    end

    def main
      app = App.new
      loop do
      display_menu
      input_number = gets.chomp.to_i

      if(input_number==1) then
        app.list_all_books
      elsif(input_number==2) then
        app.list_people
      elsif(input_number==3) then
        app.create_person 
      elsif(input_number==4)then
        app.create_book
      elsif(input_number==5)then
        app.create_rental
      elsif(input_number==6)then
        app.list_rental_per_person
      elsif(input_number==7)
        puts "Goodbye see you soon!"
      else
        puts "Invalid input !"
        break
      end
      puts "Press enter to continue.."
      gets 
    end
    end

    main