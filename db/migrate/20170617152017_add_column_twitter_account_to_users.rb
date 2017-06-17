class AddColumnTwitterAccountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :twitter_account, :string
  end
end
