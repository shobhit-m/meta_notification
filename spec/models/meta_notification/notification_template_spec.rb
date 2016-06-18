require 'rails_helper'

module MetaNotification
  RSpec.describe NotificationTemplate, type: :model do
    it "has a valid factory" do
      template = FactoryGirl.build(:notification_template)
      p template
    end
    pending "validate notification template."
    pending "creation of notification template."
    pending "update notification template."
    pending "delete notification template"
    pending "read notification template"
  end
end
