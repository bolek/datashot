require "rails_helper"

module Datashot
  describe SnapshotsHelper do
    describe ".headers_for" do
      subject { helper.headers_for(results) }

      context "when none empty results" do
        let(:results) { [{ a: 1, b: 2 }] }

        it "returns correct headers/keys" do
          expect(subject).to eq([:a, :b])
        end
      end

      context "when results is empty" do
        let(:results) { [] }

        it { expect(subject).to eq([]) }
      end

      context "when results are nil" do
        let(:results) { nil }

        it { expect(subject).to eq([]) }
      end
    end

    describe ".non_empty_results?" do
      subject { helper.non_empty_results?(results) }

      context "when results are nil" do
        let(:results) { nil }

        it { expect(subject).to eq(false) }
      end

      context "when results are empty" do
        let(:results) { [] }

        it { expect(subject).to eq(false) }
      end

      context "when results are not empty" do
        let(:results) { [{ a: 1 }, { a: 1 }] }

        it { expect(subject).to eq(true) }
      end
    end
  end
end
