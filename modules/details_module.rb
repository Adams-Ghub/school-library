require './classroom'
require './student'
require './teacher'

module DETAILS  
    def student_details
        student ={name:'', age:0, parent_permission:true, classroom:''}

      loop do
        puts 'Enter student\'s name:'
        student[:name]=gets.chomp
        break unless student[:name].empty? 
      end

      loop do
        puts 'Enter student\'s age:'
        student[:age]=gets.chomp.to_i
        break unless student[:age].zero? 
      end

      loop do
        puts 'Enter classroom label:'
        label=gets.chomp
        student[:classroom] = Classroom.new(label) if label.length
        break if label.length
      end

      loop do      
        puts 'Has parent\'s permission ?: [Y/N]'
        input=gets.chomp.downcase
        if input=='y' then
            student[:parent_permission]=true
        elsif input=='n' then
            student[:parent_permission]=false
        end
        break unless input.empty? 
      end
      student
    end

    def teacher_details
        teacher={name:'',age:0, specialization:''}
        loop do
          puts 'Enter teachers\'s name:'
          teacher[:name]=gets.chomp
          break unless teacher[:name].empty?
        end

        loop do
          puts 'Enter teacher\'s age:'
          teacher[:age]=gets.chomp.to_i
          break unless teacher[:age].zero? 
        end

        loop do
          puts 'Enter teacher\'s specialization:'
          teacher[:specialization]=gets.chomp
          break unless teacher[:specialization].empty? 
        end
      teacher
    end
end 