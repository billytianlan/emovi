class HomeController < ApplicationController
  def index
    @movies = Movie.filter_by(1970,10).sample(5)
    if current_user
      @user = current_user
      @correct_guesses = Guess.correct_guesses(current_user.id)
      @comments = Comment.all.order("created_at desc").take(20)
      @correct_guesses.each do |cg|
        @comments = @comments.reject do |comment|
          (comment.id == cg.comment_id)
        end
      end
      @guess = Guess.new
    else
      @comments = Comment.all.order("created_at desc").take(20)
    end
  end

  def top_posts
    if current_user
      @user = current_user
      @correct_guesses = Guess.correct_guesses(current_user.id)
      @comments = Comment.order("cached_votes_up desc").take(20)
      @correct_guesses.each do |cg|
        @comments = @comments.reject { |comment| (comment.id == cg.comment_id) }
      end
      @guess = Guess.new
    else
      @comments = Comment.order("cached_votes_up desc").take(20)
    end
  end

  def my_posts
    @comments = Comment.user_comments(params[:u_id])
  end

  def new_posts
    if current_user
      @user = current_user
      @correct_guesses = Guess.correct_guesses(current_user.id)
      @comments = Comment.all.order("created_at desc").take(20)
      @correct_guesses.each do |cg|
        @comments = @comments.reject { |comment| (comment.id == cg.comment_id) }
      end
      @guess = Guess.new
    else
      @comments = Comment.all.order("created_at desc").take(20)
    end
  end

  def my_correct_guesses
    @comments = Comment.guessed_correctly(params[:u_id]).includes(:guesses).joins(:guesses).order("guesses.created_at desc")
    @correct_guess = true
  end
end
