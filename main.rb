require_relative './app'

def create_a_person
  puts 'Do you want to create (1) a Student or (2) a Teacher?'
  selected = gets.chomp.to_i
  print 'Age: '
  age = gets.chomp
  print 'Name: '
  name = gets.chomp
  case selected
  when 1
    print 'Has Parent Permission (Y/N): '
    parent_permission = gets.chomp
    create_student(age, name, parent_permission, 'nil')
  when 2
    print 'Specialization: '
    specialization = gets.chomp
    create_teacher(age, name, specialization)
  end
  main
end

def create_a_book
  print 'Title: '
  title = gets.chomp
  print 'Author: '
  author = gets.chomp
  create_book(title, author)
  main
end

def create_a_rental
  puts "Select the person from the following list by number (not id)\n\n"
  @person_list.each_with_index do |person, index|
    if person.is_a?(Teacher)
      puts "[Teacher] Name: #{person.name}, ID: #{person.id} Age: #{person.age}"
    else
      puts "#{index}. [Student] Name: #{person.name}, ID: #{person.id} Age: #{person.age}"
    end
  end
  selected_person = gets.chomp.to_i
  puts "Select the book from the following list\n\n"
  @books_list.each_with_index do |book, index|
    puts "#{index}. [Book] Name: #{book.title} Author: #{book.author}"
  end
  selected_book = gets.chomp.to_i
  puts 'Date'
  date = gets.chomp
  create_rental(date, @person_list[selected_person], @books_list[selected_book])
end

def list_all_rentals
  print 'ID of person: '
  rental_id = gets.chomp.to_i
  list_rentals(rental_id)
end

puts 'Welcome to the School Library App'

def main
  puts "Please choose an option by entering an option\n"
  puts '1. List all Books'
  puts '2. List all People'
  puts '3. Create a Person'
  puts '4. Create a Book'
  puts '5. Create a Rental'
  puts '6. List all rentals for a given person id.'
  puts '7. Exit'
  option = gets.chomp.to_i

  choose_option(option)
  main
end

main
