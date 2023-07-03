require './app'

class  ActionSeclector
    def action_selector(input, app)
        case input
        when 1
            app.list_all_books
        when 2
            app.list_people
        when 3
            app.create_person
        when 4
            app.create_book
        when 5
            app.create_rental
        when 6
            app.list_rental_per_person
        end
    end
end