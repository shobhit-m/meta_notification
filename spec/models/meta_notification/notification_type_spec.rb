require 'rails_helper'

module MetaNotification
  RSpec.describe NotificationType, type: :model do
    it "validate notification type" do
      type = FactoryGirl.build(:notification_type)
      expect(type).to be_valid
    end
    it "create valid notification type" do
      type = FactoryGirl.create(:notification_type)
      expect(type.id).not_to eql(nil)
    end
  end
end
