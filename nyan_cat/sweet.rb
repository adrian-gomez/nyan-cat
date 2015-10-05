require 'gosu'

module NyanCat
  class Sweet

    attr_accessor :x, :y, :width, :height

    def initialize(window)
      @sprite = Gosu::Image.new('assets/images/candy.png')
      @x      = 100
      @y      = 200
      @width  = @sprite.width
      @height = @sprite.height

      reset!(window)
    end

    def draw
      @sprite.draw(@x, @y, 1)
    end

    def reset!(window)
      @y = Random.rand(window.height - @height)
      @x = window.width
    end

    def move!
      @x -= 15
    end

  end
end