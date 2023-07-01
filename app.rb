require './modules/book_module'
require './modules/person_module'
require './modules/rental_module'

class App
    def initialize
        @books=[]
        @students=[]
        @teachers=[]
    end

include BOOK
include PERSON
include RENTAL
end