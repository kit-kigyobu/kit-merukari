class RemoveTransactionNumsFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :exhibition_num, :int
    remove_column :users, :purchase_num, :int
    remove_column :users, :love_num, :int
  end
end
