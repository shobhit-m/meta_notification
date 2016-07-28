object false

child(@notifications => :notifications)  do
  attributes :id,:user_id, :is_read, :in_app, :mobile, :label, :icon
  node :template_name do |u|
    u.name
  end
end

node :unread_count do
  @unread_count
end
