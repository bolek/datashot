$LOAD_PATH.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "datashot/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "datashot"
  s.version     = Datashot::VERSION
  s.authors     = ["Bolek Kurowski"]
  s.email       = ["bolek@alumni.cmu.edu"]
  # s.homepage    = "TODO"
  s.summary     = "Summary of Datashot."
  s.description = "Description of Datashot."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "autoprefixer-rails"
  s.add_dependency "materialize-sass"
  s.add_dependency "sass-rails", ">= 3.2"
  s.add_dependency "haml-rails"
  s.add_dependency "jquery-rails", "~> 4.0"
  s.add_dependency "rails", "~> 4.2.0"
  s.add_dependency "render_csv", "~> 2.0"

  s.add_development_dependency "bundler", "~> 1.7"
  s.add_development_dependency "database_cleaner", "~> 1.3"
  s.add_development_dependency "factory_girl", "~> 4.0"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "rspec-rails", "~> 3.0"
  s.add_development_dependency "rspec-its", "~> 1.1"
  s.add_development_dependency "shoulda-matchers"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "timecop", "~> 0.7"
end
