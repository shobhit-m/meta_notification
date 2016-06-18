class CreateMetaNotificationNotificationTypes < ActiveRecord::Migration
  def change
    create_table :mn_notification_types do |t|
      t.string :name, null: false, unique: true
      t.string :display_name, null: false, unique: true
      t.references :created_by, null: false
      t.references :updated_by, null: false

      t.timestamps null: false
    end
  end
end
