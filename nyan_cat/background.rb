require 'gosu'

module NyanCat
  class Background

  SCROLL_SPEED = 2

  attr_accessor :x, :width

  def initialize
    @image  = Gosu::Image.new('assets/images/background.jpg', tileable: true)
    @width  = @image.width
    @x      = 0
  end

  def draw
    @image.draw(@x, 0, 0)
    @image.draw(@x - @image.width, 0, 0)
  end

  def scroll!
    @x -= SCROLL_SPEED
    @x %= @width
  end

  end
end