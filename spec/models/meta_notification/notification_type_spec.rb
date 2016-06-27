require 'rails_helper'

module MetaNotification
  RSpec.describe NotificationType, type: :model do
    14.times do |index|
      it 'check valid notification type' do
        method_name = 'valid_notification_type' + "_#{index}"
        type = FactoryGirl.build(method_name)
        pp type
        expect(type).to be_valid
      end
    end

    6.times do |index|
      it 'check invalid notification type' do
        method_name = 'invalid_notification_type' + "_#{index}"
        type = FactoryGirl.build(method_name)
        pp type
        expect(type).not_to be_valid
      end
    end

    14.times do |index|
      it 'create valid notification type' do
        method_name = 'valid_notification_type' + "_#{index}"
        type = FactoryGirl.create(method_name)
        pp type
        expect(type.id).not_to eql(nil)
      end
    end

    # it "check uniqueness of name" do
    #   should validate_uniqueness_of(:name)
    # end
  end
end
