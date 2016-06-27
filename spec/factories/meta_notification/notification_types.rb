
name_display_name_valid_hash_list = {
  'drive_create' => 'Drive Create', 'drive_update' => 'Drive Update', 'student_move' => 'Student Move',
  'recruiter_add' => 'Recruiter Add', 'coordinator_add' => 'Coordinator Add', 'message' => 'message',
  'connection_request' => 'Connection Request', 'welcome_notification' => 'Welcome Notification',
  'd_c' => 'Drive create', '_test' => 'test', 'test_' => 'test', '0test' => 'test', 'test0' => 'test', '123' => 'test'
}
name_display_name_invalid_hash_list = {
  '' => 'test', 'dc' => 'Drive Create', 'd@c' => 'Drive Create', '@dc' => 'Drive Create', 'd#c' => 'Drive Create',
  'test' => Faker::Lorem.paragraph(90)
}

FactoryGirl.define do
  name_display_name_valid_hash_list.each_with_index do |(key, value), index|
    valid_method_name = 'valid_notification_type' + "_#{index}"
    # pp valid_method_name
    factory valid_method_name.to_sym, class: MetaNotification::NotificationType do
      name key
      display_name value
      created_by_id 1
      updated_by_id 1
    end
  end

  name_display_name_invalid_hash_list.each_with_index do |(key, value), index|
    invalid_method_name = 'invalid_notification_type' + "_#{index}"
    # pp invalid_method_name
    factory invalid_method_name.to_sym, class: MetaNotification::NotificationType do
      name key
      display_name value
      created_by_id 1
      updated_by_id 1
    end
  end
end
