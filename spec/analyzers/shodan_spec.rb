# frozen_string_literal: true

RSpec.describe Mihari::Analyzers::Shodan, :vcr do
  subject { described_class.new(query, tags: tags) }

  let(:query) { "dev.min.js" }
  let(:tags) { %w(test) }

  describe "#title" do
    it do
      expect(subject.title).to eq("Shodan lookup")
    end
  end

  describe "#description" do
    it do
      expect(subject.description).to eq("query = #{query}")
    end
  end

  describe "#artifacts" do
    it do
      expect(subject.artifacts).to be_an(Array)
    end
  end

  describe "#tags" do
    it do
      expect(subject.tags).to eq(tags)
    end
  end

  context "when api config is not given" do
    before do
      allow(Mihari.config).to receive(:shodan_api_key).and_return(nil)
    end

    it do
      expect { subject.artifacts }.to raise_error(ArgumentError)
    end
  end
end
