class GamesController < ApplicationController
  def new
    @letters = []
    10.times { @letters << ('A'..'Z').to_a.sample }
  end

  def score
    @word = params[:word]
    # check if word is valid using dictionary API and @letters
    if @word.nil?
      flash[:error] = 'Word is required'
    # calculate score and store it in @score
    else
      @score = calculate_score(@word)
    end
    # render the score.html.erb template
    @score = Score.new(@word, @letters)
  end
end
