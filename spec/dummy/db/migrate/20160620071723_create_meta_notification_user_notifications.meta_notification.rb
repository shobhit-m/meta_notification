# This migration comes from meta_notification (originally 20160620015754)
class CreateMetaNotificationUserNotifications < ActiveRecord::Migration
  def change
    create_table :mn_user_notifications do |t|
      t.integer :user_id, index: true, null: false
      t.integer :notification_id, index: true, null: false
      t.boolean :is_read, null: false

      t.timestamps null: false
    end
  end
end
