require "autoprefixer-rails"
require "materialize-sass"
require "sass-rails"
require "csv"
require "haml-rails"
require "jquery-rails"

module Datashot
  class Engine < ::Rails::Engine
    isolate_namespace Datashot

    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
