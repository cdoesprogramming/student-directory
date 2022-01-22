@students = []

def print_menu
  puts "1. Input the students".center(100, ' ')
  puts "2. Show the students".center(100, ' ')
  puts "3. Save the list of students".center(100, ' ')
  puts "4. Load the list from students.csv".center(100, ' ')
  puts "9. Exit".center(100, ' ')
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
   end
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    puts "You have chosen to Input students.".center(100, ' ')
    input_students
  when "2"
    puts "You have chosen to view the list of students.".center(100, ' ')
    show_students
  when "3"
    puts "Enter a file name to save the student list:".center(100, ' ')
    save_file_name 
  when "4"
    puts "What is the name of the file?".center(100, ' ')
    check_file_name 
  when "9"
    puts "Goodbye!".center(100, ' ')
    exit
  else
    puts "I don't know what you mean, try again".center(100, ' ')
  end
end

def input_students
    enter_students
    student_name(STDIN.gets.chomp)
end


def enter_students
    puts "Please enter the names of the students".center(100, ' ')
    puts "To finish, just hit return twice".center(100, ' ')
end

def student_name(name)
  if !name.empty?
    puts "Please enter the cohort month".center(100, ' ')
    month = STDIN.gets.chomp
    puts "Are you happy with the information you have stored? Y/N".center(100, ' ')
    check = STDIN.gets.chomp
    if check == "Y"
      if month == ""
        month = "July"
      end
      add_students(name, month)
    elsif check == "N"
      input_students
    end
  end
end

def add_students(name, month)
  @students << {name: name, cohort: month.to_sym}
  puts "Now we have #{pluralize @students.count}".center(100, ' ')
    name = STDIN.gets.chomp
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

def file_name
  puts "What is the name of the file?".center(100, ' ')
  filename = STDIN.gets.chomp
end

def check_file_name
  filenamed = STDIN.gets.chomp
  if filenamed == "students.csv"
    load_students
  else puts "I don't recognise that file name. Please try again".center(100, ' ')
  end
end

def save_file_name
  savefilename = gets.chomp
  if savefilename == "students.csv"
    save_students
  else puts "Incorrect file name. Please try again.".center(100, ' ')
  end
end

def save_students
    file = File.open("students.csv", "w")
    @students.each do |student|
        student_data = [student[:name], student[:cohort]]
        csv_line = student_data.join(",")
        file.puts csv_line
    end
    file.close
    puts "File saved".center(100, ' ')
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, month = line.chomp.split(',')
    add_students(name, month)
  end
  file.close
end



def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end


interactive_menu
students = input_students
print_header
print_students_list
print_footer