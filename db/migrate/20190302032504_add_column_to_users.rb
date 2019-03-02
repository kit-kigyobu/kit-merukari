class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :club, :string
    add_column :users, :entry_year, :int
    add_column :users, :course_id, :int
    add_column :users, :exhibition_num, :int
    add_column :users, :purchase_num, :int
    add_column :users, :love_num, :int
    add_column :users, :is_ban, :boolean, default: false, null: false
    add_column :users, :is_suspend, :boolean,  default: false, null: false
  end
end
