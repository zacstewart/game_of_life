module GameOfLife
  class Cell < Struct.new(:state)

    def alive?
      state == :alive
    end

    def dead?
      state == :dead
    end

    def to_s
      alive? ? '#' : ' '
    end
  end
end
