require 'rails_helper'

module MetaNotification
  RSpec.describe UserNotification, type: :model do
    10.times do
      it 'check valid user notification ' do
        type = FactoryGirl.build(:valid_user_notification)
        pp type
        expect(type).to be_valid
      end
    end
    3.times do |index|
      it 'check invalid user notification' do
        method_name = 'invalid_user_notification' + "_#{index}"
        type = FactoryGirl.build(method_name)
        pp type
        expect(type).to be_valid
      end
    end
    10.times do
      it 'create valid user notification ' do
        type = FactoryGirl.build(:valid_user_notification)
        pp type
        expect(type).to be_valid
      end
    end
  end
end
