require "rails_helper"

module Datashot
  RSpec.describe SnapshotJob, type: :job do
    let(:snapshot) { build_stubbed(:snapshot) }

    it "reloads snapshot's query" do
      expect(snapshot).to receive(:reload_query)
      SnapshotJob.new.perform(snapshot)
    end
  end
end
