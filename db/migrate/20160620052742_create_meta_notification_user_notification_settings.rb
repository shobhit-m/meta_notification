class CreateMetaNotificationUserNotificationSettings < ActiveRecord::Migration
  def change
    create_table :mn_user_notification_settings do |t|
      t.integer :user_id, null: false
      t.integer :notification_type_id, index: true, foreign_key: true, null: false
      t.boolean :is_mute, null: false, default: false

      t.timestamps null: false
    end
    add_index :mn_user_notification_settings, [:user_id, :notification_type_id], unique: true, name: "unique_user_notification_type_index"
  end
end
