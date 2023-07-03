require './classroom'
require './student'
require './teacher'

module DETAILS
  def get_input(text)
    print text
    gets.chomp
  end

  def get_age(text)
    print text
    gets.chomp.to_i
  end

  def get_permission(text)
    puts text
    input = gets.chomp.downcase

    case input
    when 'y'
      true
    when 'n'
      false
    end
  end

  def student_details
    student = { name: '', age: 0, parent_permission: true, classroom: '' }

    loop do
      student[:name] = get_input("Enter student's name:")
      break unless student[:name].empty?
    end
    loop do
      student[:age] = get_age("Enter student's age:")
      break unless student[:age].zero?
    end
    loop do
      label = get_input('Enter classroom label:')
      student[:classroom] = Classroom.new(label) if label.length
      break if label.length
    end
    loop do
      student[:parent_permission] = get_permission("Has parent's permission ?: [Y/N]")
      break if [true, false].include? student[:parent_permission]
    end

    student
  end

  def teacher_details
    teacher = { name: '', age: 0, specialization: '' }
    loop do
      teacher[:name] = get_input("Enter teachers's name:")
      break unless teacher[:name].empty?
    end
    loop do
      teacher[:age] = get_age("Enter teacher's age:")
      break unless teacher[:age].zero?
    end
    loop do
      teacher[:specialization] = get_input("Enter teacher's specialization:")
      break unless teacher[:specialization].empty?
    end
    teacher
  end
end
