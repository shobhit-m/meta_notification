invalid_user_notification_settings_list = [
  {
    # user_id: 1,
    notification_type_id: 1,
    is_mute: true
  },
  {
    user_id: 1,
    # notification_type_id: 1,
    is_mute: true
  },
  {
    user_id: 1,
    notification_type_id: 1,
    # is_mute: true
  }
]
FactoryGirl.define do
  factory :valid_user_notification_settings, class: 'MetaNotification::UserNotificationSetting' do
    user_id { Faker::Number.between(1, 10) }
    notification_type { FactoryGirl.create(:valid_notification_type_0) }
    is_mute {Faker::Boolean.boolean(0.5)}
  end

  invalid_user_notification_settings_list.each_with_index do |list, index|
    method_name = 'invalid_user_notification_setting' + "_#{index}"
    # pp method_name
    factory method_name.to_sym, class: 'MetaNotification::UserNotificationSetting' do
      user_id list[:user_id]
      notification_type_id list[:notification_type_id]
      is_mute list[:is_mute]
    end
  end
end
