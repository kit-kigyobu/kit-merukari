class DeleteKesiteLike < ActiveRecord::Migration[5.2]
  def change
    drop_table :test_kesites
    drop_table :likes
  end
end
