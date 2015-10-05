require 'gosu'

module NyanCat
  class Cat

    attr_accessor :x, :y, :width, :height

    def initialize
      @sprites  = Gosu::Image::load_tiles('assets/images/cat.png', 847/6, 87, tileable: false)
      @x        = 10
      @y        = 200
      @width    = @sprites.first.width
      @height   = @sprites.first.height
    end

    def draw
      sprite = @sprites[Gosu::milliseconds / 75 % @sprites.size]
      sprite.draw(@x, @y, 1)
    end

    def bumped_into?(object)
      self_top    = @y
      self_bottom = @y + @height
      self_left   = @x
      self_right  = @x + @width

      object_top    = object.y
      object_bottom = object.y + object.height
      object_left   = object.x
      object_right  = object.x + object.width

      if self_top > object_bottom
        false
      elsif self_bottom < object_top
        false
      elsif self_left > object_right
        false
      elsif self_right < object_left
        false
      else
        true
      end
    end

    def move_up!
      @y -= 5
    end

    def move_down!
      @y += 5
    end

  end
end