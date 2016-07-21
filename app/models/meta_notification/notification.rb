module MetaNotification
  class Notification < ActiveRecord::Base
    validates_presence_of :notification_template_id, :in_app, :mobile
    belongs_to :created_by
    has_many :user_notifications
  end
end
