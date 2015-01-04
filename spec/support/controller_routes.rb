module MyEngine
  module RSpec
    module ControllerRoutes
      extend ActiveSupport::Concern
      included do
        routes { ::Datashot::Engine.routes }
      end
    end
  end
end
