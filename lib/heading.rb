# frozen_string_literal: true

require 'vector'

class Heading
  include Comparable

  VALUES = {
    north: Vector.new(0, 1),
    east: Vector.new(1, 0),
    south: Vector.new(0, -1),
    west: Vector.new(-1, 0)
  }.freeze

  attr_reader :key

  def initialize(key)
    raise "Unknown heading: #{key}" unless VALUES[key]

    @key = key
  end

  def to_vector
    VALUES[@key]
  end

  def left
    Heading.new(VALUES.keys[(VALUES.keys.index(@key) - 1) % VALUES.length])
  end

  def right
    Heading.new(VALUES.keys[(VALUES.keys.index(@key) + 1) % VALUES.length])
  end

  def <=>(other)
    key <=> other.key
  end

  def to_s
    key.to_s.upcase
  end
end
