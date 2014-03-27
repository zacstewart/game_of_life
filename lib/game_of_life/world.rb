module GameOfLife
  class World

    def initialize
      @cells = Hash.new { Cell.new(:dead) }
    end

    def [](coordinate)
      @cells[coordinate]
    end

    def animate(coordinate)
      @cells[coordinate] = Cell.new(:alive)
    end

    def kill(coordinate)
      @cells.delete(coordinate)
    end

    def advance
      next_world = World.new

      @cells.each do |coord, cell|
        coord.neighbors.each do |neighbor_coord|
          neighbor = self[neighbor_coord]
          if neighbor.dead? && live_neighbors_of(neighbor_coord).size == 3
            next_world.animate neighbor_coord
          end
        end

        next_world.animate coord if cell.alive? && live_neighbors_of(coord).size.between?(2, 3)
      end

      next_world
    end

    def to_s
      string = ''
      (-50..50).each do |x|
        string << '|'
        (-100..100).each do |y|
          string << self[Coordinate.new(x, y)].to_s
          string << '.'
        end
        string << "|\n"
      end
      string << '-' * 404
      string
    end

    private

    def live_neighbors_of(coordinate)
      coordinate.neighbors.select do |coord|
        self[coord].alive?
      end
    end

  end
end
