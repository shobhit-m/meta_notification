module MetaNotification
  class NotificationTemplate < ActiveRecord::Base

    validates :notification_type_id, presence: true
    validate :presence_of_any_template

    belongs_to :notification_type

    private
    def presence_of_any_template
      if in_app.blank? && mobile.blank? && push.blank? && email.blank? && sms.blank?
        errors[:base] << "Template for any one or more target is required."
      end

    end
  end
end
