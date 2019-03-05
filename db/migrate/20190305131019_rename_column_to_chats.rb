class RenameColumnToChats < ActiveRecord::Migration[5.2]
  def change
    rename_column :chats, :type, :message_type
    rename_column :chats, :context, :message
  end
end
