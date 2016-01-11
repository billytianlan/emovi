class AddCommentIdToGuesses < ActiveRecord::Migration
  def change
    add_column :guesses, :comment_id, :integer
  end
end
