module MetaNotification
  class UserNotificationSetting < ActiveRecord::Base
    belongs_to :notification_type
    belongs_to :user

    validates :notification_type_id, presence: true, format: { with: /[0-9]/, message: "only allows integers." }
    validates :user_id, presence: true, format: { with: /[0-9]/, message: "only allows integers." }
    validates :is_mute, inclusion: { in: [true, false] }
  end
end
