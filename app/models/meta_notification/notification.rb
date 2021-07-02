module MetaNotification
  class Notification < ActiveRecord::Base
    has_attached_file :attachment
    do_not_validate_attachment_file_type :attachment
    # mount_uploader :attachment, AttachmentUploader

    validates_presence_of :notification_template_id, :in_app, :mobile

    belongs_to :resource, polymorphic: true
    has_many :user_notifications
    has_many :users, through: :user_notifications
  end
end
