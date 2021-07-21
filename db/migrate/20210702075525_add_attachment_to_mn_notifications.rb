class AddAttachmentToMnNotifications < ActiveRecord::Migration[5.0]
  def change
    add_column :mn_notifications, :attachment, :string
  end
end
