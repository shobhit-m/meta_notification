# This migration comes from meta_notification (originally 20160615074820)
class CreateMetaNotificationNotificationTypes < ActiveRecord::Migration
  def change
    create_table :mn_notification_types do |t|
      t.string :name, null: false, unique: true, limit: 255
      t.string :display_name, limit: 255
      t.references :created_by, null: false
      t.references :updated_by, null: false

      t.timestamps null: false
    end
  end
end
