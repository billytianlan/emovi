class AddMovieLensRatingToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :movie_lens_rating, :integer
  end
end
