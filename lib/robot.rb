# frozen_string_literal: true

require 'table'

class Robot
  attr_reader :position, :heading

  def initialize(table)
    @table = table
    @position = nil
    @heading = nil
  end

  def place(position, heading)
    return false unless @table.valid_position?(position)

    @position = position
    @heading = heading
    true
  end

  def move
    return false unless placed?

    next_position = @position + @heading.to_vector

    return false unless @table.valid_position?(next_position)

    @position = next_position
    true
  end

  def left
    return false unless placed?

    @heading = heading.left
    true
  end

  def right
    return false unless placed?

    @heading = heading.right
    true
  end

  private

  def placed?
    @position && @heading
  end
end
