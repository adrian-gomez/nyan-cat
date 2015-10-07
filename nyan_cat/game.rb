require 'gosu'

require_relative 'cat'
require_relative 'scoreboard'
require_relative 'sweet'

module NyanCat
  class Game < Gosu::Window

    def initialize
      super(900, 550, fullscreen: false)
      self.caption = 'Nyan cat!'

      @cat        = NyanCat::Cat.new
      @sweet      = NyanCat::Sweet.new(self)
      @scoreboard = NyanCat::Scoreboard.new
    end

    def update
      @sweet.move!

      @sweet.reset!(self) if @sweet.x < 0

      if button_down? Gosu::KbUp
        @cat.move_up!
      end

      if button_down? Gosu::KbDown
        @cat.move_down!
      end

      if @cat.bumped_into?(@sweet)
        @scoreboard.increment_score!
        @sweet.reset!(self)
      end
    end

    def draw
      @cat.draw
      @sweet.draw
      @scoreboard.draw
    end

    def button_down(id)
      if id == Gosu::KbEscape
        close
      end
    end

  end
end