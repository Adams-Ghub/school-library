require './app'
require './action-selector'

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
  action = ActionSeclector.new
  loop do
    display_menu
    input_number = gets.chomp.to_i
    if input_number.positive? and input_number < 7
      action.action_selector(input_number, app)
    elsif input_number == 7
      puts 'Goodbye see you soon!'
    else
      puts 'Invalid input !'
    end
    puts 'Press enter to continue..'
    gets
  end
end

main
