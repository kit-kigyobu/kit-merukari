class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.belongs_to :account
      t.string :name
      t.integer :gender
      t.text :content
      t.string :club
      t.integer :entry_year
      t.integer :course_id
      t.string :icon
      t.boolean :is_ban, default: false, null: false
      t.boolean :is_suspend, default: false, null: false
      t.timestamps
    end
  end
end
