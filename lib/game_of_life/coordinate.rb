require 'set'

module GameOfLife
  class Coordinate < Struct.new(:x, :y)

    def neighbors
      (left..right).flat_map do |x|
        (down..up).map do |y|
          Coordinate.new(x, y)
        end
      end.to_set.delete(self)
    end

    private

    def left
      x - 1
    end

    def right
      x + 1
    end

    def up
      y + 1
    end

    def down
      y - 1
    end
  end
end
