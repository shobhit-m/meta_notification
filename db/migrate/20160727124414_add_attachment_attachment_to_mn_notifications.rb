class AddAttachmentAttachmentToMnNotifications < ActiveRecord::Migration
  def self.up
    change_table :mn_notifications do |t|
      t.attachment :attachment
    end
  end

  def self.down
    remove_attachment :mn_notifications, :attachment
  end
end
