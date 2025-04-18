# frozen_string_literal: true

require 'runner'

RSpec.describe Runner do
  it 'parses commands and executes them against a robot' do
    [
      'PLACE 0,0,NORTH',
      'MOVE',
      ['REPORT', '0,1,NORTH'],
      'PLACE 0,0,NORTH',
      'LEFT',
      ['REPORT', '0,0,WEST'],
      'PLACE 1,2,EAST',
      'MOVE',
      'MOVE',
      'LEFT',
      'MOVE',
      ['REPORT', '3,3,NORTH']
    ].each do |(command, expected_output)|
      expect(subject.run(command)).to eq(expected_output)
    end
  end
end
