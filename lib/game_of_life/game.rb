module GameOfLife
  class Game < Struct.new(:seed)
    def play
      @world = seed

      puts "Playing Game of Life"
      loop do
        @world = @world.advance
        STDOUT.puts @world.to_s
        STDOUT.flush
        sleep 0.01
      end
    end
  end
end
