class AddMovieLensTotalRatingCountToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :movie_lens_total_rating_count, :integer
  end
end
