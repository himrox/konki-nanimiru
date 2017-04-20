class AddIndexToCour < ActiveRecord::Migration[5.0]
  def change
    add_index :cours, [:year, :season], unique: true
  end
end
