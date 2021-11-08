class GamesController < ApplicationController

  def new
    # num = 260
    rndm = Array(1..260)
    @grid = []
    letters = Array('A'..'Z')
    10.times do
      letter = letters[rndm.sample % 26]
      @grid << letter
    end
    @grid
  end

  def score
  end

end
