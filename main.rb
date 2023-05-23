# frozen_string_literal: true

require_relative './app'
require './app'

def create_person_menu
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
  main_menu
end

def create_book_menu
  print 'Title: '
  title = gets.chomp
  print 'Author: '
  author = gets.chomp
  create_book(title, author)
  main_menu
end

def create_rental_menu
  puts "Select a person by entering the corresponding number:\n\n"
  $person_list.each_with_index do |person, index|
    type = person.is_a?(Teacher) ? '[Teacher]' : '[Student]'
    puts "#{index}. #{type} Name: #{person.name}, ID: #{person.id} Age: #{person.age}"
  end
  selected_person = gets.chomp.to_i
  puts "Select a book by entering the corresponding number:\n\n"
  $books_list.each_with_index do |book, index|
    puts "#{index}. [Book] Name: #{book.title} Author: #{book.author}"
  end
  selected_book = gets.chomp.to_i
  puts 'Date: '
  date = gets.chomp
  create_rental(date, $person_list[selected_person], $books_list[selected_book])
end

def list_rentals_menu
  print 'Enter the person ID: '
  rental_id = gets.chomp.to_i
  list_rentals(rental_id)
end

puts 'Welcome to the School Library App'

def main_menu
  puts "Please choose an option by entering the corresponding number:\n\n"
  puts '1. List all Books'
  puts '2. List all People'
  puts '3. Create a Person'
  puts '4. Create a Book'
  puts '5. Create a Rental'
  puts '6. List all rentals for a given person ID'
  puts '7. Exit'
  option = gets.chomp.to_i

  case option
  when 1
    list_books
  when 2
    list_people
  when 3
    create_person_menu
  when 4
    create_book_menu
  when 5
    create_rental_menu
  when 6
    list_rentals_menu
  when 7
    exit
  else
    puts 'Invalid option. Please try again.'
  end

  main_menu
end

main_menu
