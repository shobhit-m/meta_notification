module MnAuthorizers
  class NotificationTemplateAuthorizer
    def self.creatable_by?(current_user)
      true
    end
    def creatable_by?(current_user, resource=nil)
      true
    end
    def self.updatable_by?(current_user)
      true
    end
    def updatable_by?(current_user, resource=nil)
      true
    end
    def self.readable_by?(current_user)
      true
    end
    def readable_by?(current_user, resource=nil)
      true
    end
    def self.deletable_by?(current_user)
      true
    end
    def deletable_by?(current_user, resource=nil)
      true
    end
  end
end
