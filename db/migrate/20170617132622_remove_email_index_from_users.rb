class RemoveEmailIndexFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_index :users, :email
    change_column_null :users, :email, true
  end
end
