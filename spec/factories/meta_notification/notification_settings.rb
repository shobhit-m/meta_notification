require 'pp'
invalid_notification_setting_list = [
  {
    # notification_type_id: 1,
    is_mute: true
  },
  {
    notification_type_id: 1
    # is_mute: true
  }
]

FactoryGirl.define do
  factory :valid_notification_setting, class: 'MetaNotification::NotificationSetting' do
    # pp 'valid_notification_setting'
    notification_type { FactoryGirl.create(:valid_notification_type_0) } # list[:notification_type_id]
    is_mute { Faker::Boolean.boolean(0.5) }
  end

  invalid_notification_setting_list.each_with_index do |list, index|
    invalid_method_name = 'invalid_notification_setting' + "_#{index}"
    # pp invalid_method_name
    factory invalid_method_name.to_sym, class: 'MetaNotification::NotificationSetting' do
      notification_type_id list[:notification_type_id]
      is_mute list[:is_mute]
    end
  end
end
