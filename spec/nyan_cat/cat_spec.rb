require 'spec_helper'

require 'nyan_cat/cat'

describe NyanCat::Cat do

  let(:cat) { NyanCat::Cat.new }

  describe '#move_up!' do

    it 'decrements the cat y position by 5' do
      expect {
        cat.move_up!
      }.to change(cat, :y).by(-5)
    end

  end

  describe '#move_down!' do

    it 'increments the cat y position by 5' do
      expect {
        cat.move_down!
      }.to change(cat, :y).by(5)
    end

  end

  describe '#bumped_into?' do

    let(:object_class)  { Struct.new(:x, :y, :width, :height) }

    let(:cat_x)       { 10 }
    let(:cat_y)       { 10 }
    let(:cat_width)   { cat.width }
    let(:cat_height)  { cat.height }

    before do
      cat.x = cat_x
      cat.y = cat_y
    end

    it 'returns false when the object is above of the cat' do
      object = object_class.new(cat_x, cat_y + cat_height + 1, 5, 5)

      expect(cat.bumped_into?(object)).to be(false)
    end

    it 'returns false when the object is below the cat' do
      object = object_class.new(cat_x, cat_y - 5 - 1, 5, 5)

      expect(cat.bumped_into?(object)).to be(false)
    end

    it 'returns false when the object is behind the cat' do
      object = object_class.new(cat_x - 5 - 1, cat_y, 5, 5)

      expect(cat.bumped_into?(object)).to be(false)
    end

    it 'returns false when the object is ahead of the cat' do
      object = object_class.new(cat_x + cat_width + 1, cat_y, 5, 5)

      expect(cat.bumped_into?(object)).to be(false)
    end

    it "'returns true when the object's bottom is exactly on the cat's top'" do
      object = object_class.new(cat_x, cat_y + cat_height, 5, 5)

      expect(cat.bumped_into?(object)).to be(true)
    end

    it "'returns true when the object's top is exactly on the cat's bottom'" do
      object = object_class.new(cat_x, cat_y - 5, 5, 5)

      expect(cat.bumped_into?(object)).to be(true)
    end

    it "returns true when the object's rear is exactly on the cat's front" do
      object = object_class.new(cat_x + cat_width, cat_y, 5, 5)

      expect(cat.bumped_into?(object)).to be(true)
    end

    it "returns true when the object's front is exactly on the cat's rear" do
      object = object_class.new(cat_x - 5, cat_y, 5, 5)

      expect(cat.bumped_into?(object)).to be(true)
    end

    it 'returns true when the object is on the cat' do
      object = object_class.new(cat_x, cat_y, 5, 5)

      expect(cat.bumped_into?(object)).to be(true)
    end

  end

end