FactoryGirl.define do
  factory :user_notification, class: 'MetaNotification::UserNotification' do
    user_id nil
    notification_id nil
    is_read false
  end
end
