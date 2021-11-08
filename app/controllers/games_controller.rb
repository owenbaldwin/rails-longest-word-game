require 'open-uri'

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

  # def score
  #   # raise
  #   url = "https://wagon-dictionary.herokuapp.com/#{params[:answer]}"
  #   data_fetch = JSON.parse(URI.open(url).read)

  # end

  # def included?(guess, @grid)
  #   guess.chars.all? { |letter| guess.count(letter) <= @grid.count(letter) }
  # end


  def score
    @answer_array = params[:answer].upcase.chars
    @grid = params[:grid]
    if @answer_array.all? { |letter| @answer_array.count(letter) <= @grid.count(letter) }
      if english_word?(params[:answer])
        @result = 'well done'
      else
        @result = 'not a word'
      end
    else
      @result = 'not in the grid'
    end
  end

  def english_word?(word)
    response = URI.open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    return json['found']
  end

end
