require_relative './book'
require_relative './student'
require_relative './teacher'
require_relative './rental'

$person_list = []
$rentals_list = []
$students_list = []
$teachers_list = []
$books_list = []


def list_all_books
  return unless defined?($books_list)

  $books_list.each do |book|
    puts "[Book] Title: #{book.title} Author: #{book.author}"
  end
end

def list_all_people
  return unless defined?($person_list)

  $person_list.each do |person|
    if defined?(person.specialization)
      puts "[Teacher] Name: #{person.name}, ID: #{person.id} Age: #{person.age}"
    else
      puts "[Student] Name: #{person.name}, ID: #{person.id} Age: #{person.age}"
    end
  end
end

def create_student(age, name, _specialization, classroom)
  student = Student.new(age, name, parent_permission, classroom)
  return unless student.is_a?(Person)

  $person_list << student
  puts "Student created successfully \n\n"
end

def create_teacher(age, name, specialization)
  teacher = Teacher.new(age, name, nil, specialization)
  return unless teacher.is_a?(Person)

  $person_list << teacher
  puts "Teacher created successfully \n\n"
end

def create_a_book(title, author)
  books = Book.new(title, author)

  return unless books.is_a?(Book)

  $books_list << books
  puts 'Book created sucessfully'
end

def create_rental(date, person, book)
  rental = Rental.new(date, person, book)

  return unless rental.is_a?(Rental)

  $rentals_list << rental

  puts 'Rentals created successfully'
end

def list_all_rentals(id)
  $person_list.each do |person|
    if person.id == id
      person.rentals.each do |rental|
        puts "[Rental] Date: #{rental.date}, Title: #{rental.book.title} Author: #{rental.book.author}"
      end
    else
      puts 'No rental for this student.'
    end
  end
end

def exit_action
  exit
end

def choose_option(option)
  all_options = {
    1 => :list_all_books,
    2 => :list_all_people,
    3 => :create_a_person,
    4 => :create_a_book,
    5 => :create_a_rental,
    6 => :list_all_rentals,
    7 => :exit_action
  }

  all_options.each do |op, value|
    send(value) if op == option.to_i
  end
end
