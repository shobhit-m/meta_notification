module MetaNotification
  class NotificationType < ActiveRecord::Base

    validates :name, :presence => true, :uniqueness => true, :length => {in: 3..256}, format: { with: /^[a-zA-Z0-9_]+$/, message: "only allows letters, numbers and underscores" }
    validates :display_name, :presence => true, :uniqueness => true, :length => {in: 3..256}

    after_create :create_template

    has_many :notification_template, dependent: destroy

    private

    def create_template
      # create blank template for the notification type with source_type/source_id = nil.
    end
  end
end
