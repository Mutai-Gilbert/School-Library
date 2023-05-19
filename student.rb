require './person_class'

class Student < Person
  def initialize(_name, age, _parent_permission, classroom)
    super(age, name: 'Uknown', _parent_permission: true)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
