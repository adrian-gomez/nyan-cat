require 'spec_helper'

require 'nyan_cat/sweet'

describe NyanCat::Sweet do


  let(:window_height) { 800 }
  let(:window_width)  { 600 }
  let(:window)        { Gosu::Window.new(window_width, window_height) }
  let(:sweet)         { NyanCat::Sweet.new(window) }

  describe '#move!' do

    it 'decrements the x by 15' do
      expect {
        sweet.move!
      }.to change(sweet, :x).by(-15)
    end

  end

  describe '#reset!' do

    it 'sets the x to the windows width' do
      sweet.x = 10

      expect {
        sweet.reset!(window)
      }.to change(sweet, :x).to(window_width)
    end

    it "'sets the y to the random number between 0 and it's height minus and the windows width'" do
      sweet.reset!(window)
      expect(sweet.y).to be_between(0, window_height - sweet.height)
    end

  end

end