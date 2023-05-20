require_relative './book'
require_relative './student'
require_relative './teacher'
require_relative './rental'

class Library
  def initialize
    @person_list = []
    @rentals_list = []
    @books_list = []
  end

  def list_all_books
    @books_list.each do |book|
      puts "[Book] Title: #{book.title} Author: #{book.author}"
    end
  end

  def list_all_people
    @person_list.each do |person|
      if person.is_a?(Teacher)
        puts "[Teacher] Name: #{person.name}, ID: #{person.id} Age: #{person.age}"
      else
        puts "[Student] Name: #{person.name}, ID: #{person.id} Age: #{person.age}"
      end
    end
  end

  def create_student(age, name, parent_permission, classroom)
    student = Student.new(age, name, parent_permission, classroom)
    if student.is_a?(Person)
      @person_list << student
      puts "Student created successfully \n\n"
    end
  end

  def create_teacher(age, name, specialization)
    teacher = Teacher.new(age, name, nil, specialization)
    if teacher.is_a?(Person)
      @person_list << teacher
      puts "Teacher created successfully \n\n"
    end
  end

  def create_a_book(title, author)
    book = Book.new(title, author)
    if book.is_a?(Book)
      @books_list << book
      puts 'Book created successfully'
    end
  end

  def create_rental(date, person, book)
    rental = Rental.new(date, person, book)
    if rental.is_a?(Rental)
      @rentals_list << rental
      puts 'Rental created successfully'
    end
  end

  def list_all_rentals(id)
    person = @person_list.find { |p| p.id == id }
    if person
      person.rentals.each do |rental|
        puts "[Rental] Date: #{rental.date}, Title: #{rental.book.title} Author: #{rental.book.author}"
      end
    else
      puts 'No rentals for this student.'
    end
  end

  def exit_action
    exit
  end

  def choose_option(option)
    case option.to_i
    when 1 then list_all_books
    when 2 then list_all_people
    when 3 then create_a_person
    when 4 then create_a_book
    when 5 then create_a_rental
    when 6 then list_all_rentals
    when 7 then exit_action
    end
  end
end
