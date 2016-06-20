module MetaNotification
  class Notification < ActiveRecord::Base
    belongs_to :created_by
    has_many :user_notifications
  end
end
