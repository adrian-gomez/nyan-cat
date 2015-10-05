require 'spec_helper'

require 'nyan_cat/background'

describe NyanCat::Background do

  let(:background) { NyanCat::Background.new }

  describe '#scroll!' do

    it 'decrements the x position by 2' do
      background.x = 10

      expect {
        background.scroll!
      }.to change(background, :x).by(-2)
    end

    it 'starts over when it reaches -1' do
      background.x = 1

      expect {
        background.scroll!
      }.to change(background, :x).to(background.width - 1)
    end

  end

end