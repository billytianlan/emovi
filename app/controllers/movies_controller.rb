class MoviesController < ApplicationController

  def show
    @movie = Movie.find(params[:id])
    # @comments = @event.comment_threads.order('created_at desc')
    if current_user
      @user = current_user
      @new_comment = Comment.build_from(@movie, current_user.id, "")
    end
  end

  def more_movies
    @movies = Movie.filter_by(2000,10).sample(5)
  end
end
