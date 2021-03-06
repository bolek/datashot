# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../dummy/config/environment", __FILE__)
require "rspec/rails"
require "rspec/its"

require "database_cleaner"
require "factory_girl"
require "shoulda/matchers"
require "timecop"

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
ENGINE_RAILS_ROOT = File.join(File.dirname(__FILE__), "../")
Dir[File.join(ENGINE_RAILS_ROOT, "spec/support/**/*.rb")].each { |f| require f }
Dir[File.join(ENGINE_RAILS_ROOT, "spec/factories/**/*.rb")].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |c|
  c.infer_spec_type_from_file_location!
  c.include FactoryGirl::Syntax::Methods
  c.include MyEngine::RSpec::ControllerRoutes, type: :controller

  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # c.mock_with :mocha
  # c.mock_with :flexmock
  # c.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  c.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  c.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  c.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  c.order = "random"
  c.before(:all) { FactoryGirl.reload }
end
