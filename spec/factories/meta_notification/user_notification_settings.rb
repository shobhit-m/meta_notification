FactoryGirl.define do
  factory :user_notification_setting, class: 'MetaNotification::UserNotificationSetting' do
    user_id 1
    notification_type_id 1
    is_mute false
  end
end
