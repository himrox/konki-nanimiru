class CreateAnimes < ActiveRecord::Migration[5.0]
  def change
    create_table :animes do |t|
      t.string :title
      t.string :public_url
      t.integer :cour_id
      t.integer :api_number
      t.text :story
      t.string :img_url

      t.timestamps
    end
  end
end
