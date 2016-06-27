require 'rails_helper'


module MetaNotification
  RSpec.describe NotificationTemplate, type: :model do
    10.times do
      it "validation of notification template" do
        template = FactoryGirl.build(:valid_notification_template)
        pp template
        expect(template).to be_valid
      end
    end

    2.times do |index|
      it "null validation of notification template" do
        method_name = 'invalid_notification_template' + "_#{index}"
        template = FactoryGirl.build(method_name)
        pp template
        expect(template).not_to be_valid
      end
    end

    10.times do
      it "create valid notification template" do
        template = FactoryGirl.create(:valid_notification_template)
        pp template
        expect(template).to be_valid
      end
    end

    # pending "validate notification template."
    # pending "creation of notification template."
    # pending "update notification template."
    # pending "delete notification template"
    # pending "read notification template"
  end
end
