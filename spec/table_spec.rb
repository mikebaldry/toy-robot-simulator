# frozen_string_literal: true

require 'table'
require 'vector'

RSpec.describe Table do
  describe '#valid_position?' do
    it 'returns true for positions within the bounds of a 5x5 table' do
      [
        [0, 0], [0, 1], [0, 2], [0, 3], [0, 4],
        [1, 0], [1, 1], [1, 2], [1, 3], [1, 4],
        [2, 0], [2, 1], [2, 2], [2, 3], [2, 4],
        [3, 0], [3, 1], [3, 2], [3, 3], [3, 4],
        [4, 0], [4, 1], [4, 2], [4, 3], [4, 4]
      ].each do |(x, y)|
        expect(subject.valid_position?(Vector.new(x, y))).to be_truthy
      end
    end

    it 'returns false for positions outside the bounds of a 5x5 table' do
      expect(subject.valid_position?(Vector.new(0, -1))).to be_falsey
      expect(subject.valid_position?(Vector.new(-1, 0))).to be_falsey
      expect(subject.valid_position?(Vector.new(-1, -1))).to be_falsey

      expect(subject.valid_position?(Vector.new(0, 5))).to be_falsey
      expect(subject.valid_position?(Vector.new(5, 0))).to be_falsey
      expect(subject.valid_position?(Vector.new(5, 5))).to be_falsey
    end
  end
end
