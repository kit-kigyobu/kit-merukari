class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.string :email
      t.string :sex
      t.text :content
      t.string :image_name

      t.timestamps
    end
  end
end
