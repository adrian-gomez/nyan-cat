require 'spec_helper'

require 'nyan_cat/scoreboard'

describe NyanCat::Scoreboard do

  let(:scoreboard) { NyanCat::Scoreboard.new }

  describe '#increment_score!' do

    it 'increments the score by 1' do
      expect {
        scoreboard.increment_score!
      }.to change(scoreboard, :score).by(1)
    end

  end

end