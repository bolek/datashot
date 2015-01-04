module Datashot
  class SnapshotJob < ActiveJob::Base
    queue_as :default

    def perform(snapshot)
      snapshot.reload_query
    end
  end
end
