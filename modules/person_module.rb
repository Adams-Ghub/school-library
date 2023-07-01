require './person'
require './teacher'
require './student'
require './modules/details_module'

module PERSON
  include DETAILS

  def create_student
    details = student_details
    student = Student.new(details[:classroom], details[:age], details[:name], details[:parent_permission])
    @students << student
    puts 'Student created successfully'
  end

  def create_teacher
    details = teacher_details
    teacher = Teacher.new(details[:age], details[:name], details[:specialization])
    @teachers << teacher
    puts 'Teacher created successfully'
  end

  def create_person
    number = 0
    loop do
      print 'Do you want to create a student(1) or teacher(2) [input number]:'
      number = gets.chomp.to_i
      if number == 1
        create_student
        break
      elsif number == 2
        create_teacher
        break
      else
        puts 'Invalid number. Try again'
      end
    end
  end

  def list_people
    puts 'No person availabel' unless @students.length.positive? and @teachers.length.positive?
    puts 'All people:'
    @teachers.each_with_index do |teacher, index|
      puts "[teacher] Name:#{teacher.name}  ID:#{index}  Age:#{teacher.age} "
    end
    @students.each_with_index do |student, index|
      puts "[student] Name:#{student.name}  ID:#{index}  Age:#{student.age} "
    end
  end
end
