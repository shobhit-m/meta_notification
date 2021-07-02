class CreateMetaNotificationNotificationTypes < ActiveRecord::Migration[4.2]
  def change
    create_table :mn_notification_types do |t|
      t.string :name, null: false, unique: true, limit: 255
      t.string :display_name, limit: 255
      t.string :label, limit: 255
      t.string :icon, limit: 255
      t.text :description
      t.references :created_by, null: false
      t.references :updated_by, null: false

      t.timestamps null: false
    end
  end
end
