module MetaNotification
  class NotificationType < ActiveRecord::Base

    validates :name, :presence => true, :uniqueness => true, :length => {in: 3..256}, format: { with: /\A[a-zA-Z0-9_]+\z/, message: "only allows letters, numbers and underscores" }
    validates :display_name, :length => {maximum: 255}

    after_create :after_create_notification_type

    has_many :notification_templates, :dependent => :destroy
    has_one :notification_setting, :dependent => :destroy

    private

    def after_create_notification_type
      # create blank template for the notification type with resource_type/resource_id = nil.
      template = NotificationTemplate.new({notification_type_id: id})
      template.save(validate: false)
      # create notification_settings for the notification type.
      NotificationSetting.create({notification_type_id: id})
    end
  end
end
