# frozen_string_literal: true

class Nameable
  def correct_name
    raise NotImplementedError, "#{self.class} should adhere to decorators"
  end
end
