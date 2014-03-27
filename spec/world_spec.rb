require_relative '../lib/game_of_life/world'
require_relative '../lib/game_of_life/coordinate'

describe GameOfLife::World do
  subject(:world) { GameOfLife::World.new }
  let(:coordinate) { GameOfLife::Coordinate.new(0, 0) }

  describe '#[]' do
    context 'when nothing has been set' do
      it 'is dead' do
        expect(world[coordinate]).to be_dead
      end
    end
  end

  describe '#animate' do
    it 'sets a cell to alive' do
      world.animate coordinate
      expect(world[coordinate]).to be_alive
    end
  end

  describe '#kill' do
    it 'sets a cell top dead' do
      world.kill coordinate
      expect(world[coordinate]).to be_dead
    end
  end

  describe '#advance' do
    it 'returns a world' do
      expect(world.advance).to be_a(GameOfLife::World)
    end

    context 'with a dead cell' do
      context 'that has that has three neighbors' do
        before do
          world.animate GameOfLife::Coordinate.new(-1, 0)
          world.animate GameOfLife::Coordinate.new(0, 1)
          world.animate GameOfLife::Coordinate.new(1, 0)
        end

        it 'should come to life' do
          new_world = world.advance
          expect(new_world[coordinate]).to be_alive
        end
      end
    end

    context 'with a live cell' do
      context 'that has one live neighbor' do
        before do
          world.animate coordinate
          world.animate GameOfLife::Coordinate.new(-1, 0)
        end

        it 'should die from under-population' do
          new_world = world.advance
          expect(new_world[coordinate]).to be_dead
        end
      end

      context 'that has two live neighbors' do
        before do
          world.animate coordinate
          world.animate GameOfLife::Coordinate.new(-1, 0)
          world.animate GameOfLife::Coordinate.new(0, 1)
        end

        it 'should survive' do
          new_world = world.advance
          expect(new_world[coordinate]).to be_alive
        end
      end

      context 'that has four live neighbors' do
        before do
          world.animate coordinate
          world.animate GameOfLife::Coordinate.new(-1, -1)
          world.animate GameOfLife::Coordinate.new(-1, 0)
          world.animate GameOfLife::Coordinate.new(0, 1)
          world.animate GameOfLife::Coordinate.new(1, 0)
        end

        it 'should survive' do
          new_world = world.advance
          expect(new_world[coordinate]).to be_dead
        end
      end
    end
  end
end
