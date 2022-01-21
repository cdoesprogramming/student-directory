@students = []

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
   end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "9"
    exit
  else
    puts "I don't know what you mean, try again"
  end
end

def input_students
    enter_students
    student_name(gets.chomp)
end


def enter_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
end

def student_name(name)
  if !name.empty?
    puts "Please enter the cohort month"
    month = gets.chomp
    puts "Are you happy with the information you have stored? Y/N"
    check = gets.chomp
      if check == "Y"
        if month == ""
          month = "July"
        end
        @students << {name: name, cohort: month}
      elsif check == "N"
        input_students
      end
        puts "Now we have #{pluralize @students.count}"
        name = gets.chomp
    end
end
    
def pluralize(plural)
    if plural == 1 then "#{plural} student"
    else "#{plural} students"
    end
end

def print_header
    puts "The students of Villains Academy".center(100, ' ')
    puts "-------------".center(100)
end

def print_students_list
    @students.each do |student|
      student_list = "#{student [:name]}, (#{student[:cohort]} cohort)".split('_').join(' ')
      puts student_list.center(100)
end

def print_footer
    puts "-------------".center(100)
    puts "Overall, we have #{pluralize @students.count}".center(100, ' ')
end
end

interactive_menu
students = input_students
print_header
print_students_list
print_footer