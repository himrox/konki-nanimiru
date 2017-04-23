class AddIndexToAnime < ActiveRecord::Migration[5.0]
  def change
    add_index :animes, [:title, :cour_id], unique: true
  end
end
