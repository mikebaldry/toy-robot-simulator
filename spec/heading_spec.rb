# frozen_string_literal: true

require 'heading'

RSpec.describe Heading do
  describe '#initialize' do
    it 'works with the expected heading keys' do
      expect(Heading.new(:north).key).to eq(:north)
      expect(Heading.new(:east).key).to eq(:east)
      expect(Heading.new(:south).key).to eq(:south)
      expect(Heading.new(:west).key).to eq(:west)
    end

    it 'raises an error for unknown heading keys' do
      expect { Heading.new(:south_south_west) }.to raise_error('Unknown heading: south_south_west')
    end
  end

  context 'north' do
    subject { Heading.new(:north) }

    describe '#to_vector' do
      it 'returns the correct vector to change a position to the next position north' do
        expect(subject.to_vector).to eq(Vector.new(0, 1))
      end
    end

    describe '#left' do
      it 'returns the west heading' do
        expect(subject.left).to eq(Heading.new(:west))
      end
    end

    describe '#right' do
      it 'returns the east heading' do
        expect(subject.right).to eq(Heading.new(:east))
      end
    end
  end

  context 'east' do
    subject { Heading.new(:east) }

    describe '#to_vector' do
      it 'returns the correct vector to change a position to the next position east' do
        expect(subject.to_vector).to eq(Vector.new(1, 0))
      end
    end

    describe '#left' do
      it 'returns the north heading' do
        expect(subject.left).to eq(Heading.new(:north))
      end
    end

    describe '#right' do
      it 'returns the south heading' do
        expect(subject.right).to eq(Heading.new(:south))
      end
    end
  end

  context 'south' do
    subject { Heading.new(:south) }

    describe '#to_vector' do
      it 'returns the correct vector to change a position to the next position south' do
        expect(subject.to_vector).to eq(Vector.new(0, -1))
      end
    end

    describe '#left' do
      it 'returns the east heading' do
        expect(subject.left).to eq(Heading.new(:east))
      end
    end

    describe '#right' do
      it 'returns the west heading' do
        expect(subject.right).to eq(Heading.new(:west))
      end
    end
  end

  context 'west' do
    subject { Heading.new(:west) }

    describe '#to_vector' do
      it 'returns the correct vector to change a position to the next position west' do
        expect(subject.to_vector).to eq(Vector.new(-1, 0))
      end
    end

    describe '#left' do
      it 'returns the south heading' do
        expect(subject.left).to eq(Heading.new(:south))
      end
    end

    describe '#right' do
      it 'returns the north heading' do
        expect(subject.right).to eq(Heading.new(:north))
      end
    end
  end

  describe '#<=>' do
    it 'compares headings of the same key to be equal' do
      expect(Heading.new(:north)).to eq(Heading.new(:north))
      expect(Heading.new(:east)).to eq(Heading.new(:east))
      expect(Heading.new(:south)).to eq(Heading.new(:south))
      expect(Heading.new(:west)).to eq(Heading.new(:west))
    end

    it 'compares headings with different keys to not be equal' do
      expect(Heading.new(:north)).to_not eq(Heading.new(:east))
      expect(Heading.new(:east)).to_not eq(Heading.new(:south))
      expect(Heading.new(:south)).to_not eq(Heading.new(:west))
      expect(Heading.new(:west)).to_not eq(Heading.new(:north))
    end
  end
end
