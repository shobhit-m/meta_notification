require 'rails_helper'

module MetaNotification
  RSpec.describe NotificationType, type: :model do
    it "has a valid factory" do
      # type = NotificationType.new({name: 'asdas', display_name: 'asdasdasd', created_by_id: 1, updated_by_id: 1})
      type = FactoryGirl.build(:notification_type)
      p type
    end
    # pending "validate notification type."
    # pending "creation of notification type."
    # pending "create notification_template in callback of notification type creation."
    # pending "created notification_template only have notification_type, every other field must be nil, bypassing validations."
    # pending "update notification type."
    # pending "delete notification type"
    # pending "read notification type"
  end
end
