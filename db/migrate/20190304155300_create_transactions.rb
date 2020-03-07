class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :book_id, null:false
      t.integer :parchase_user_id, null:false
      t.integer :exhibit_user_id, null:false
      t.integer :parchase_status, default: 0, null:false
      t.integer :exhibit_status, default: 0, null:false
      t.integer :love
      t.timestamps
    end
  end
end
