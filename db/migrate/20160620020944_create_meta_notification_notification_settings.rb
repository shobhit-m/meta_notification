class CreateMetaNotificationNotificationSettings < ActiveRecord::Migration[4.2]
  def change
    create_table :mn_notification_settings do |t|
      t.integer :notification_type_id, unique: true, foreign_key: true, null: false
      t.boolean :is_mute, null: false, default: false

      t.timestamps null: false
    end
  end
end
