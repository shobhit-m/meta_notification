require 'rails_helper'

module MetaNotification
  RSpec.describe NotificationSetting, type: :model do
    10.times do
      it "check valid notification setting" do
        notification = FactoryGirl.build(:valid_notification_setting)
        pp notification
        expect(notification).to be_valid
      end
    end

    2.times do|index|
      it "check invalid notification setting" do
        method_name="invalid_notification_setting"+"_#{index}"
        notification = FactoryGirl.build(method_name)
        pp notification
        expect(notification).not_to be_valid
      end
    end

    10.times do
      it "create valid notification setting" do
        notification = FactoryGirl.create(:valid_notification_setting)
        pp notification
        expect(notification).to be_valid
      end
    end

  end
end
