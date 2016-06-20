FactoryGirl.define do
  factory :notification_setting, class: 'MetaNotification::NotificationSetting' do
    notification_type_id 1
    is_mute false
  end
end
