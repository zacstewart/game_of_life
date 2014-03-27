require 'set'
require_relative '../lib/game_of_life/coordinate'

describe GameOfLife::Coordinate do
  subject(:coordinate) { described_class.new(0, 0) }

  describe '#neighbors' do
    let(:neighbors) { Set[
      described_class.new(-1, -1),
      described_class.new(0, -1),
      described_class.new(1, -1),
      described_class.new(1, 0),
      described_class.new(1, 1),
      described_class.new(0, 1),
      described_class.new(-1, 1),
      described_class.new(-1, 0),
    ] }

    it 'should return six eight neighbors' do
      expect(coordinate.neighbors).to have(8).items
    end

    it 'returns the set of adjacent coordinates' do
      expect(coordinate.neighbors).to eq(neighbors)
    end
  end
end
