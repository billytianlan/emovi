class AddMovieLensIdToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :movie_lens_id, :integer
  end
end
