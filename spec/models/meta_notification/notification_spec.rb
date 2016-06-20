require 'rails_helper'

module MetaNotification
  RSpec.describe Notification, type: :model do
    it "has a valid factory" do
      notification = FactoryGirl.build(:notification)
      p notification
    end
    pending "validate notification."
    pending "read notification type."
  end
end
