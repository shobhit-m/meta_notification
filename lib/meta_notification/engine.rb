module MetaNotification
  class Engine < ::Rails::Engine
    isolate_namespace MetaNotification

    config.generators do |g|
      g.test_framework :rspec, :fixture => false
      g.fixture_replacement :factory_girl, :dir => 'spec/factories/meta_notificaiton'
      g.assets false
      g.helper false
    end
  end
end
