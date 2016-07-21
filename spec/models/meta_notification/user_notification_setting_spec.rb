require 'rails_helper'

module MetaNotification
  RSpec.describe UserNotificationSetting, type: :model do
    10.times do
      it 'check valid user notification settings' do
        type = FactoryGirl.build(:valid_user_notification_settings)
        pp type
        expect(type).to be_valid
      end
    end

    3.times do |index|
      it 'check invalid user notification settings' do
        method_name = 'invalid_user_notification_setting' + "_#{index}"
        pp method_name
        type = FactoryGirl.build(method_name)
        pp type
        expect(type).not_to be_valid
      end
    end

    10.times do
      it 'create valid user notification settings' do
        type = FactoryGirl.create(:valid_user_notification_settings)
        pp type
        expect(type).to be_valid
      end
    end
  end
end
