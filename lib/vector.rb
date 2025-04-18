# frozen_string_literal: true

class Vector
  include Comparable

  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def +(other)
    Vector.new(x + other.x, y + other.y)
  end

  def <=>(other)
    [x, y] <=> [other.x, other.y]
  end

  def to_s
    [x, y].join(',')
  end
end
