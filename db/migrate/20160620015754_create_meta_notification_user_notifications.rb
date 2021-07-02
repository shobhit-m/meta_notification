class CreateMetaNotificationUserNotifications < ActiveRecord::Migration[4.2]
  def change
    create_table :mn_user_notifications do |t|
      t.integer :user_id, index: true, null: false
      t.integer :notification_id, index: true, null: false
      t.integer :notification_type_id, index: true, null: false
      t.boolean :is_read, null: false

      t.timestamps null: false
    end
  end
end
