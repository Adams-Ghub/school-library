require './app'
require './action_selector'
require './display_menu'

def main
  app = App.new
  action = ActionSeclector.new
  menu = DisplayMenu.new
  loop do
    menu.display_menu
    input_number = gets.chomp.to_i
    if input_number.positive? and input_number < 7
      action.action_selector(input_number, app)
    elsif input_number == 7
      puts 'Goodbye see you soon!'
      app.save_rental
      app.save_books
      app.save_person
    else
      puts 'Invalid input !'
    end
    puts 'Press enter to continue..'
    gets
  end
end

main
