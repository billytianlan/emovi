class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to home_index_path
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
    @comments = @user.comments.order("created_at desc").take(20)
    @guess = Guess.new
  end

  def new_posts
    @user = User.find(params[:id])
    @comments = @user.comments.order("created_at desc").take(20)
    @guess = Guess.new
  end

  def top_posts
    @user = User.find(params[:id])
    @comments = @user.comments.order("cached_votes_up desc").take(20)
    @guess = Guess.new
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end

end

