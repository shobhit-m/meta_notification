class CreateMetaNotificationNotificationTemplates < ActiveRecord::Migration
  def change
    create_table :mn_notification_templates do |t|
      t.references :notification_type, null: false
      t.text :in_app
      t.text :mobile
      t.text :push
      t.text :email
      t.text :sms
      t.text :email_subject
      t.integer :resource_id
      t.string :resource_type

      t.timestamps null: false
    end
    add_index :mn_notification_templates, [:notification_type_id, :resource_type, :resource_id], unique: true, name: "unique_type_resource_index"
    add_index :mn_notification_templates, [:resource_type, :resource_id], name: "resource_index"
  end
end
