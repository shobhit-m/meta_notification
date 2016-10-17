object false

child(@notifications => :notifications)  do
  attributes :id,:user_id, :is_read, :in_app, :mobile, :label, :icon, :created_at, :mn_user_notification_id
  node :template_name do |notification|
    notification.name
  end
  node :first_name do |notification|
    @created_by_users.map{|user| user.first_name if notification.created_by_id == user.id}.compact.first
  end
  node :last_name do |notification|
    @created_by_users.map{|user| user.last_name if notification.created_by_id == user.id}.compact.first
  end
  node :attachment do |notification|
   notification.attachment.url if notification.attachment.present?
  end
end

node :unread_count do
  @unread_count
end
