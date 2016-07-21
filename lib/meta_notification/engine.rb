module MetaNotification
  class Engine < ::Rails::Engine
    isolate_namespace MetaNotification

    config.generators do |g|
      g.test_framework :rspec, :fixture => false
      g.fixture_replacement :factory_girl, :dir => 'spec/factories/meta_notification'
      g.assets false
      g.helper false
    end
    # config.autoload_paths << File.expand_path("../../lib/meta_notificaiton/authorizers", __FILE__)
    config.autoload_paths += Dir["#{config.root}/lib/"]
    config.autoload_paths += Dir["#{config.root}/lib/mn_authorizers/*"]
  end
end
