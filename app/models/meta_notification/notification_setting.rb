module MetaNotification
  class NotificationSetting < ActiveRecord::Base
    belongs_to :notification_type

    validates :notification_type_id, presence: true, format: { with: /[0-9]/, message: "only allows integers." }
    validates :is_mute, presence: true, inclusion: { in: [true, false] }
  end
end
