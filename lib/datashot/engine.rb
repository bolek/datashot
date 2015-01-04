require "autoprefixer-rails"
require "bootstrap-material-design"
require "sass-rails"
require "bootstrap-sass"
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
