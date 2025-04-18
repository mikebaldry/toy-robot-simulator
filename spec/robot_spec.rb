# frozen_string_literal: true

require 'robot'
require 'table'

RSpec.describe Robot do
  subject { described_class.new(table) }

  let(:table) { Table.new }

  let(:valid_position) { Vector.new(1, 1) }
  let(:invalid_position) { Vector.new(5, 5) }

  let(:heading) { Heading.new(:east) }

  describe '#place' do
    context 'position is considered valid' do
      it 'sets the position and heading and returns true' do
        expect(subject.place(valid_position, heading)).to be_truthy
        expect(subject.position).to eq(valid_position)
        expect(subject.heading).to eq(heading)
      end
    end

    context 'position is considered invalid' do
      it "doesn't set the position or heading and returns false" do
        expect(subject.place(invalid_position, heading)).to be_falsey
        expect(subject.position).to be_nil
        expect(subject.heading).to be_nil
      end

      context 'a position and heading are already set' do
        before do
          subject.place(valid_position, heading)
        end

        it 'leaves position and heading as they are' do
          expect(subject.place(invalid_position, heading.left)).to be_falsey
          expect(subject.position).to eq(valid_position)
          expect(subject.heading).to eq(heading)
        end
      end
    end
  end

  describe '#move' do
    context "robot isn't placed yet" do
      it 'returns false' do
        expect(subject.move).to be_falsey
      end
    end

    context 'robot has been placed' do
      context 'the new position is valid' do
        before do
          subject.place(Vector.new(0, 0), Heading.new(:north))
        end

        it 'sets the position and returns true' do
          expect(subject.move).to be_truthy
          expect(subject.position).to eq(Vector.new(0, 1))
        end
      end

      context 'the new position is not valid' do
        before do
          subject.place(Vector.new(0, 0), Heading.new(:south))
        end

        it "doesn't change the position and returns false" do
          expect(subject.move).to be_falsey
          expect(subject.position).to eq(Vector.new(0, 0))
        end
      end
    end
  end

  describe '#left' do
    context "robot isn't placed yet" do
      it 'returns false' do
        expect(subject.left).to be_falsey
      end
    end

    context 'robot has been placed' do
      before do
        subject.place(Vector.new(0, 0), Heading.new(:north))
      end

      it 'sets the heading to the left heading of the current heading and returns true' do
        expect(subject.left).to be_truthy
        expect(subject.heading).to eq(Heading.new(:west))
      end
    end
  end

  describe '#right' do
    context "robot isn't placed yet" do
      it 'returns false' do
        expect(subject.right).to be_falsey
      end
    end

    context 'robot has been placed' do
      before do
        subject.place(Vector.new(0, 0), Heading.new(:north))
      end

      it 'sets the heading to the right heading of the current heading and returns true' do
        expect(subject.right).to be_truthy
        expect(subject.heading).to eq(Heading.new(:east))
      end
    end
  end
end
