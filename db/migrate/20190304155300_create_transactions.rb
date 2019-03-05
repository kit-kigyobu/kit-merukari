class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :book_id
      t.integer :parchase_user_id
      t.integer :exhibit_user_id
      t.integer :parchase_status, default: 0, null:false
      t.integer :exhibit_status, default: 0, null:false

      t.timestamps
    end
  end
end
