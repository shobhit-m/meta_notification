invalid_user_notification_list = [
  {
    # user_id: 1,
    notification_id: 1,
    is_read: false
  },
  {
    user_id: 1,
    # notification_id: 1,
    is_read: true
  },
  {
    user_id: 1,
    notification_id: 1,
    # is_read: nil
  }
]

FactoryGirl.define do
  factory :valid_user_notification, class: 'MetaNotification::UserNotification' do
    user_id { Faker::Number.between(1, 10) }
    notification_id { Faker::Number.between(1, 10) }
    is_read { Faker::Boolean.boolean(0.5) }
  end

  invalid_user_notification_list.each_with_index do |list, index|
    invalid_method_name = 'invalid_user_notification' + "_#{index}"
    # pp invalid_method_name
    factory invalid_method_name.to_sym, class: 'MetaNotification::UserNotification' do
      user_id list[:user_id]
      notification_id list[:notification_id]
      is_read list[:is_read]
    end
  end
end
