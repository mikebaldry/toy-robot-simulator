# frozen_string_literal: true

require 'vector'

RSpec.describe Vector do
  describe '#initialize' do
    it 'stores the passed values' do
      vector = described_class.new(3, 2)
      expect(vector.x).to eq(3)
      expect(vector.y).to eq(2)
    end
  end

  describe '#+' do
    it 'returns a new vector with the values added' do
      expect(described_class.new(3, 2) + described_class.new(1, -1)).to eq(described_class.new(4, 1))
    end
  end

  describe '#<=>' do
    it 'compares vectors of the same value to be equal' do
      expect(described_class.new(0, 0)).to eq(described_class.new(0, 0))
      expect(described_class.new(1, 2)).to eq(described_class.new(1, 2))
      expect(described_class.new(2, 1)).to eq(described_class.new(2, 1))
    end

    it 'compares vectors with different values to not be equal' do
      expect(described_class.new(0, 0)).not_to eq(described_class.new(0, 1))
      expect(described_class.new(0, 0)).not_to eq(described_class.new(1, 0))
      expect(described_class.new(0, 0)).not_to eq(described_class.new(1, 1))
    end
  end
end
