require_relative '../lib/game_of_life/cell'

describe GameOfLife::Cell do
  context 'with a dead cell' do
    subject(:cell) { GameOfLife::Cell.new(:dead) }

    it 'is dead' do
      expect(cell).to be_dead
    end
  end

  context 'with a live cell' do
    subject(:cell) { GameOfLife::Cell.new(:alive) }

    it 'is alive' do
      expect(cell).to be_alive
    end
  end
end
