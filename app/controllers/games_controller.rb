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
    @letters = params["letters"].split
    @words = params[:word].upcase
    @included = included?(@words, @letters)
    @english_word = english_word?(@words)
  end

   private 

   def included?(words, letters)
     words.chars.all? { |letter| words.count(letter) <= letters.count(letter)}
   end

   def english_word?(word)
    response = open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    json['found']
  end
   
  
  
end


