class ChageDetatypeOfSex < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :sex
    add_column :users, :gender, :int
  end
end
