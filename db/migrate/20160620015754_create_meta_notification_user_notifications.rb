class CreateMetaNotificationUserNotifications < ActiveRecord::Migration
  def change
    create_table :mn_user_notifications do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.references :notification, index: true, foreign_key: true, null: false
      t.boolean :is_read, null: false

      t.timestamps null: false
    end
  end
end
