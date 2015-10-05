require 'gosu'

module NyanCat
  class Scoreboard

    attr_reader :score

    def initialize
      @font = Gosu::Font.new(72, name: 'Arial')
      @score = 0
    end

    def increment_score!
      @score += 1
    end

    def draw
      @font.draw(@score, 0, 0, 1)
    end

  end
end