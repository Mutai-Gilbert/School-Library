require './person_class'

class Teacher
  def initialize(_name, age, _parent_permission, specialization)
    super(age, name: 'Unknown', _parent_permission: true)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
