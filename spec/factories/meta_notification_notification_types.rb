FactoryGirl.define do
  factory :meta_notification_notification_type, class: 'MetaNotification::NotificationType' do
    name "MyString"
    display_name "MyString"
    created_by_id 1
    updated_by_id 1
  end
end
