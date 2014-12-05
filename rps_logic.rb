module Games
  class RPS
    include Comparable
    WINS = [ %W{rock scissors}, %W{scissors paper}, %W{paper rock} ]
    attr_accessor :move

    def initialize(move)
      @move = move.to_s
    end

    def <=>(other)
      if move == other.move
        0
      elsif WINS.include?([move, other.move])
        1
      elsif WINS.include?([other.move, move])
        -1
      else
        raise ArgumentError, "something went wrong"
      end
    end

    def play(other)
      if self > other
        self
      elsif other > self
        other
      else
        false
      end
    end

  end
end