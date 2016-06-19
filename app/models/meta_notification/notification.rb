module MetaNotification
  class Notification < ActiveRecord::Base
    belongs_to :created_by
  end
end
