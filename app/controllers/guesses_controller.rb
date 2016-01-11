class GuessesController < ApplicationController

  def create
    binding.pry
    @guess = Guess.new(guess_params)
    if @guess.save
      @correct = false
      check_if_guess_is_correct
    end
  end

  def check_if_guess_is_correct
    comment = @guess.comment
    movie = Movie.find(comment.commentable_id)
    binding.pry
    if movie.title.downcase.split('(').first.strip == @guess.body.downcase.strip
      @guess.correct = true
      @guess.save
    end
  end

  private

  def guess_params
    params.require(:guess).permit(:body, :user_id, :comment_id)
  end
end
