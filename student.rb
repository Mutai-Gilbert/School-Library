require './person_class'
require './classroom'

class Student < Person
  def initialize(_name, age, _parent_permission, classroom)
    super(age, name: 'Uknown', _parent_permission: true)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.includes?(self)
  end
end
