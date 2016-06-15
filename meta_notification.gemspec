$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "meta_notification/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "meta_notification"
  s.version     = MetaNotification::VERSION
  s.authors     = ["Shobhit Dixit"]
  s.email       = ["shobhit-m@github.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of MetaNotification."
  s.description = "TODO: Description of MetaNotification."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.2"
  s.add_development_dependency "mysql2", '0.3.18'

  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails'
end
