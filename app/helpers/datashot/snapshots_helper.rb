module Datashot
  module SnapshotsHelper
    def headers_for(results)
      return [] if results.nil? || results.first.nil?
      results.first.keys
    end

    def non_empty_results?(results)
      !(results.nil? || results.empty?)
    end
  end
end
