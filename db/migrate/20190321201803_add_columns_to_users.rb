class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :account_id, :integer
  end
end
