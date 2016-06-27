require 'faker'

invalid_notification_template_list=[
  {
    notification_type: "blank",
    in_app: Faker::Lorem.word,
    mobile: Faker::Lorem.word,
    push: Faker::Lorem.word,
    email: Faker::Lorem.paragraph(5),
    sms: Faker::Lorem.words(10).join(" "),
    email_subject: Faker::Lorem.words(5).join(" "),
    resource_id: Faker::Number.between(1, 10),
    resource_type: Faker::Lorem.word
  },
  {
    # in_app: Faker::Lorem.word,
    # mobile: Faker::Lorem.word,
    # push: Faker::Lorem.word,
    # email: Faker::Lorem.paragraph(5),
    # sms: Faker::Lorem.words(10).join(" "),
    email_subject: Faker::Lorem.words(5).join(" "),
    resource_id: Faker::Number.between(1, 10),
    resource_type: Faker::Lorem.word
  }
]
FactoryGirl.define do
  factory :valid_notification_template, class: 'MetaNotification::NotificationTemplate' do
    # pp "valid_notification_template"
    notification_type  {FactoryGirl.create(:valid_notification_type_0)}
    in_app {Faker::Lorem.word}
    mobile {Faker::Lorem.word}
    push {Faker::Lorem.word}
    email {Faker::Lorem.paragraph(5)}
    sms {Faker::Lorem.words(10).join(" ")}
    email_subject {Faker::Lorem.words(5).join(" ")}
    resource_id {Faker::Number.between(1, 10)}
    resource_type {Faker::Lorem.word}
  end


  invalid_notification_template_list.each_with_index do |list, index|
    invalid_method_name = 'invalid_notification_template' + "_#{index}"
    factory invalid_method_name.to_sym, class: 'MetaNotification::NotificationTemplate' do
      if list[:notification_type]=="blank"
        notification_type nil
      else
        notification_type  {FactoryGirl.create(:valid_notification_type_0)}
      end
      in_app list[:in_app]
      mobile list[:mobile]
      push list[:push]
      email list[:email]
      sms list[:sms]
      email_subject list[:email_subject]
      resource_id list[:resource_id]
      resource_type list[:resource_type]
    end
  end
end
