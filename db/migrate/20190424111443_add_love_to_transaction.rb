class AddLoveToTransaction < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :love, :int
  end
end
