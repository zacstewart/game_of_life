require 'curses'

module GameOfLife
  class Game
    def initialize(seed, top = -50, right = 100, bottom = 50, left = -100)
      @world = seed
      @top = top
      @right = right
      @bottom = bottom
      @left = left

      @window = Curses::Window.new(200, 400, 0, 0)
      @window.box ?|, ?-
      @window.nodelay = true
      @window.keypad = true
    end

    def play
      puts "Playing Game of Life"
      loop do
        @world = @world.advance
        @window.setpos 0, 0
        @window.addstr @world.as_string(@top, @right, @bottom, @left)
        @window.refresh
        command @window.getch
      end
    end

    private

    def command(cmd)
      case cmd
      when 260
        @left -= 3
        @right -= 3
      when 261
        @left += 3
        @right += 3
      when 259
        @top -= 3
        @bottom -= 3
      when 258
        @top += 3
        @bottom += 3
      end
    end
  end
end
