class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.integer :transaction_id
      t.integer :type
      t.string :context
      t.timestamps
    end
  end
end
