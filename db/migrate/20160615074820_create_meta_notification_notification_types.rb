class CreateMetaNotificationNotificationTypes < ActiveRecord::Migration
  def change
    create_table :mn_notification_types do |t|
      t.string :name
      t.string :display_name
      t.integer :created_by_id
      t.integer :updated_by_id

      t.timestamps null: false
    end
  end
end
