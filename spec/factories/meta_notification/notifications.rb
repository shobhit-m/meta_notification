FactoryGirl.define do
  factory :notification, class: 'MetaNotification::Notification' do
    notification_template_id 1
    in_app "MyText"
    mobile "MyText"
    resource_type "MyString"
    resource_id 1
    created_by_id 1
  end
end
