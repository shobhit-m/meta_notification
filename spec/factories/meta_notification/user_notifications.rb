FactoryGirl.define do
  factory :user_notification, class: 'MetaNotification::UserNotification' do
    user nil
    notification nil
    is_read false
  end
end
