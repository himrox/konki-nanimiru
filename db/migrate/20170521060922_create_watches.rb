class CreateWatches < ActiveRecord::Migration[5.0]
  def change
    create_table :watches do |t|
      t.integer :user_id
      t.integer :anime_id

      t.timestamps
    end
  end
end
