require 'json'
require 'open-uri'

# url = 'https://wagon-dictionary.herokuapp.com/'
# word_serialized = open(url).read
# word = JSON.parse(word_serialized)

class GamesController < ApplicationController

  def new
    # @letters = ('a'..'z').to_a.shuffle[0,10].join
    # @max_letter = @letters.max_by(&:length)
    alphabet = ("A".."Z").to_a
    @letters = []
    10.times do 
      @letters << alphabet.sample
    end
  end

  def score
    @letters = params["letters"]
    @words = params[:word]
    # raise
    # IF the word is using letter from the grid
   end
  
  
end
