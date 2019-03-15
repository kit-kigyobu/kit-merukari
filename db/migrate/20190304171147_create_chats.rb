class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.integer :transaction_id, null:false
      t.integer :message_type, null:false, default:0
      t.string :message
      t.timestamps
    end
  end
end
