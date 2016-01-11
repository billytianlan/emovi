class CommentsController < ApplicationController

  def show
    binding.pry
    @comment = Comment.find(params[:id])
    @movie = Movie.find(@comment.commentable_id) if @comment
  end

  def create

    @comment_hash = params[:comment]
    @obj = @comment_hash[:commentable_type].constantize.find(@comment_hash[:commentable_id])
        # Not implemented: check to see whether the user has permission to create a comment on this object
    @comment = Comment.build_from(@obj, current_user.id, @comment_hash[:body])
    if @comment.save
      @guess = Guess.new
      @comments = Comment.all.order("created_at desc").take(10)
      render 'create'
    else
      render :js => "alert_box.show('Something went wrong, please try again.');"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to :back
    else
      render :js => "alert_box.show('Something went wrong, please try again.');"
    end
  end

  def upvote
    @comment = Comment.find(params[:c_id])
    @user = User.find(params[:u_id])

    if @comment.find_votes_for(:voter => @user).present?

      @comment.unliked_by @user
    else

      @comment.liked_by @user
    end
  end

end
