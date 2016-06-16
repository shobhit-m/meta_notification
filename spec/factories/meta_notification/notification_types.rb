name_display_name_hash_list = {
  "drive_create" =>"drive_create", "drive_update"=>"drive_update", "student_move"=> "student_move",
  "recruiter_add" => "recruiter_add", "coordinator_add" => "coordinator_add", "message" => "message",
  "connection_request" => "connection_request", "welcome_notification" => "welcome_notification"
}

FactoryGirl.define do
  name_display_name_hash = name_display_name_hash_list.to_a.sample(1).to_h
  factory :notification_type, class: MetaNotification::NotificationType do
    name name_display_name_hash.keys.first
    display_name name_display_name_hash.values.first
    created_by_id 1
    updated_by_id 1
  end
end
