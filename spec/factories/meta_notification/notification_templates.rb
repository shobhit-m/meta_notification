FactoryGirl.define do
  factory :notification_template, class: 'MetaNotification::NotificationTemplate' do
    in_app "MyString"
    mobile "MyString"
    push "MyString"
    email "MyText"
    sms "MyString"
    email_subject "MyString"
    resource_id 1
    resource_type "MyString"
  end
end
