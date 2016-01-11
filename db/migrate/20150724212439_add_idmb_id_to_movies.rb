class AddIdmbIdToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :imdb_id, :integer
  end
end
