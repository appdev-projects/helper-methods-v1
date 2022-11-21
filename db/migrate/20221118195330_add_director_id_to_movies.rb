class AddDirectorIdToMovies < ActiveRecord::Migration[6.1]
  def change
    add_reference :movies, :director, null: true, foreign_key: true
  end
end
