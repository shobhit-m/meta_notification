module MetaNotification
  class NotificationType < ActiveRecord::Base

    validates :name, :presence => true, :uniqueness => true, :length => {in: 3..256}, format: { with: /^[a-zA-Z0-9_]+$/, message: "only allows letters, numbers and underscores" }
    validates :display_name, :length => {in: 3..256}

    after_create :after_create_notification_type

    has_many :notification_template, dependent: destroy

    private

    def after_create_notification_type
      # create blank template for the notification type with source_type/source_id = nil.

      # create notification_settings for the notification type.
    end
  end
end
