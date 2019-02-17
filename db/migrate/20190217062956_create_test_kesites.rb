class CreateTestKesites < ActiveRecord::Migration[5.2]
  def change
    create_table :test_kesites do |t|
      t.text :content

      t.timestamps
    end
  end
end
