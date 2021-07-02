class CreateMetaNotificationNotifications < ActiveRecord::Migration[4.2]
  def change
    create_table :mn_notifications do |t|
      t.integer :notification_template_id, null: false, index: true
      t.text :in_app, null: false
      t.text :mobile, null: false
      t.string :resource_type
      t.integer :resource_id
      t.references :created_by, index: true, null: false

      t.timestamps null: false
    end
  end
end
