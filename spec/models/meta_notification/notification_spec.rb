require 'rails_helper'

module MetaNotification
  RSpec.describe Notification, type: :model do
    2.times do
      it 'check valid notification' do
        notification = FactoryGirl.build(:valid_notification)
        pp notification
        expect(notification).to be_valid
      end
    end

    2.times do |index|
      it 'check null validation for notification' do
        method_name = 'null_validation_notification' + "_#{index}"
        notification = FactoryGirl.build(method_name)
        pp notification
        expect(notification).to be_valid
      end
    end

    3.times do |index|
      it 'check invalid notification' do
        method_name = 'invalid_notification' + "_#{index}"
        notification = FactoryGirl.build(method_name)
        pp notification
        expect(notification).not_to be_valid
      end
    end

    2.times do 
      it 'create valid notification type' do
        notification = FactoryGirl.create(:valid_notification)
        pp notification
        expect(notification.id).not_to eql(nil)
      end
    end
  end
end
