require './book'

module BOOK
  def list_all_books
    puts 'No books available!!' if @books.empty?

    puts "All books: #{@books.length}"
    @books.each do |book|
      puts "Title: #{book.title}, Author:#{book.author}"
    end
  end

  def create_book
    title = ''
    author = ''

    loop do
      puts 'Enter book title:'
      title = gets.chomp
      break unless title.empty?
    end

    loop do
      puts 'Enter book author:'
      author = gets.chomp
      break unless title.empty?
    end

    book = Book.new(title, author)
    @books.push(book)
    puts 'New book added!'
  end
end
