require "rails_helper"

module Datashot
  describe Snapshot do
    subject { create(:snapshot, name: "abc", query: "SELECT * FROM test_models;") }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:query) }

    its(:name) { is_expected.to eq("abc") }
    its(:query) { is_expected.to eq("SELECT * FROM test_models;") }

    describe ".reload_query" do
      context "when valid query" do
        subject { Timecop.freeze(Time.new(2000).utc) { create(:snapshot).reload_query } }

        its(:error_message) { is_expected.to be_nil }
        its(:result) { is_expected.to eq("[]") }
        its(:last_ran_at) { is_expected.to eq(Time.new(2000).utc) }
      end

      context "when invalid query" do
        subject { Timecop.freeze(Time.new(2000).utc) { create(:snapshot, query: "Invalid query").reload_query } }

        its(:error_message) { is_expected.to eq("SQLite3::SQLException: near \"Invalid\": syntax error: Invalid query") }
        its(:result) { is_expected.to be_nil }
        its(:last_ran_at) { is_expected.to eq(Time.new(2000).utc) }
      end
    end
  end
end
