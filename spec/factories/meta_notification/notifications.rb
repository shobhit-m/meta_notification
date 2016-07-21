
notification_list_for_null_validation=[{
                notification_template_id:1,
                in_app: "test",
                mobile: "test",
                # resource_type: "test",
                resource_id: 1,
                created_by_id: 1
            },
            {
                notification_template_id:1,
                in_app: "test",
                mobile: "test",
                resource_type: "test",
                # resource_id: 1,
                created_by_id: 1
            },
]
invalid_list=[{
                # notification_template_id:nil,
                in_app: "test",
                mobile: "test",
                resource_type: "test",
                resource_id: 1,
                created_by_id: 1
            },
            {
                notification_template_id:1,
                # in_app: nil,
                mobile: "test",
                resource_type: "test",
                resource_id: 1,
                created_by_id: 1
            },
            {
                notification_template_id:1,
                in_app: "test",
                # mobile: "test",
                resource_type: "test",
                resource_id: 1,
                created_by_id: 1
            }
  ]

FactoryGirl.define do
    factory :valid_notification, class: 'MetaNotification::Notification' do
      notification_template_id {Faker::Number.between(1, 10)}
      in_app {Faker::Lorem.words(15).join(" ")}
      mobile {Faker::Lorem.words(10).join(" ")}
      resource_type {Faker::Lorem.word}
      resource_id {Faker::Number.between(1, 10)}
      created_by_id {Faker::Number.between(1, 10)}
    end

  notification_list_for_null_validation.each_with_index do|list,index|
    valid_method_name="null_validation_notification"+"_#{index}"
    # pp valid_method_name
    factory valid_method_name.to_sym, class: 'MetaNotification::Notification' do
      notification_template_id list[:notification_template_id]
      in_app list[:in_app]
      mobile list[:mobile]
      resource_type list[:resource_type]
      resource_id list[:resource_id]
      created_by_id list[:created_by_id]
    end
  end

  invalid_list.each_with_index do|list,index|
    invalid_method_name="invalid_notification"+"_#{index}"
    # pp invalid_method_name
    factory invalid_method_name.to_sym, class: 'MetaNotification::Notification' do
      notification_template_id list[:notification_template_id]
      in_app list[:in_app]
      mobile list[:mobile]
      resource_type list[:resource_type]
      resource_id list[:resource_id]
      created_by_id list[:created_by_id]
    end
  end
end
