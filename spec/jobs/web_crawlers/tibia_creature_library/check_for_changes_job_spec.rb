# frozen_string_literal: true

require "rails_helper"

RSpec.describe(WebCrawlers::TibiaCreatureLibrary::CheckForChangesJob, type: :job) do
  let(:call) { described_class.new.perform }

  describe "#perform" do
    it "should enqueue subsequent jobs" do
      VCR.use_cassette("app/jobs/web_crawlers/tibia_creature_library/check_for_changes_job.rb") do
        expect { call }.to(
          have_enqueued_job(WebCrawlers::TibiaCreatureLibrary::CheckCreatureLibraryEntryForChangesJob).at_least(100),
        )
      end
    end
  end
end
