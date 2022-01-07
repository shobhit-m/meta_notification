$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "meta_notification/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "meta_notification"
  s.version     = MetaNotification::VERSION
  s.authors     = ["Shobhit Dixit"]
  s.email       = ["shobhit-m@github.com"]
  s.homepage    = "https://github.com/shobhit-m/meta_notification"
  s.summary     = "Summary of MetaNotification."
  s.description = "MetaNotification: A module to send notifications."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "spec/factories/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "6.0.3"
  s.add_development_dependency "pg", '0.19'

  s.add_development_dependency 'rspec-rails', "~> 3.4"
  s.add_development_dependency 'capybara', "2.7.1"
  s.add_development_dependency 'factory_girl_rails', "4.7.0"
  s.add_development_dependency 'faker', "1.6.3"
end
