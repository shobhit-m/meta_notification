collection @notifications
attributes :id, :in_app, :mobile, :label, :icon, :created_at
node :template_name, &:name
node :created_by do |notification|
  user = @created_by_users.map { |user| user if notification.created_by_id == user.id }.first
  { id: user.id, email: user.email, first_name: user.first_name, last_name: user.last_name } if user.present?
end
child :users do
  attributes :id, :email, :first_name, :last_name
end

node :attachment do |notification|
  notification.attachment.url if notification.attachment.present?
end
