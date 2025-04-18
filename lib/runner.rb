# frozen_string_literal: true

require 'robot'
require 'table'
require 'vector'
require 'heading'

class Runner
  def self.from_file(path)
    runner = Runner.new
    File.readlines(path, chomp: true).each do |line|
      output = runner.run(line)
      puts(output) if output
    end
  end

  def initialize
    @robot = Robot.new(Table.new)
  end

  def run(line)
    command, params = line.split(/\s+/, 2)

    case command
    when 'PLACE'
      run_place(params)
    when 'MOVE'
      @robot.move
    when 'LEFT'
      @robot.left
    when 'RIGHT'
      @robot.right
    when 'REPORT'
      return "#{@robot.position},#{@robot.heading}"
    end

    nil
  end

  private

  def run_place(params)
    x, y, heading = params.split(',', 3)
    position = Vector.new(Integer(x), Integer(y))
    heading = Heading.new(heading&.downcase&.to_sym)

    @robot.place(position, heading)
  end
end
