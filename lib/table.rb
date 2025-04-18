# frozen_string_literal: true

require 'vector'

class Table
  def initialize
    @size = Vector.new(5, 5)
  end

  def valid_position?(vector)
    return false if vector.x.negative?
    return false if vector.y.negative?
    return false if vector.x >= @size.x
    return false if vector.y >= @size.y

    true
  end
end
