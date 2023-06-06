# frozen_string_literal: true

require "rails_helper"

RSpec.describe(WebCrawlers::TibiaCreatureLibrary::CheckCreatureLibraryEntryForChangesJob, type: :job) do
  let(:race) { "elf" }
  let(:call) { described_class.new.perform(race) }

  describe "#perform" do
    context "when race still not recorded" do
      it "creates entry on database" do
        # rubocop:disable Layout/LineLength(RuboCop)
        VCR.use_cassette("app/jobs/web_crawlers/tibia_creature_library/check_creature_library_entry_for_changes_job.rb") do
          # rubocop:enable Layout/LineLength(RuboCop)
          expect { call }.to(
            change(Monster, :count).by(1),
            change(CreatureLibraryEntry, :count).by(1),
          )
        end
      end
    end

    context "when race already recorded" do
      let(:monster) { create(:monster) }
      let!(:creature_library_entry) do
        create(:creature_library_entry, monster: monster, race: race, description: description)
      end

      context "when description matches" do
        let(:description) do
          "Elves are a very ancient human-like race. They have a tall and beautiful figure. In former days they "\
            "travelled all over Tibia, now they have retreated to an area in the north of Tibia where they live in "\
            "dwellings made out of flourishing trees. Some of them are quite hospitable, but others are very "\
            "suspicious towards any intruder and will try to repel him using their bows. Having a long history, "\
            "the Elves are very skilled in magic, and almost every Elf knows some spells.\nElves have 100 hitpoints. "\
            "They are strong against holy damage. On the other hand, they are weak against death damage. It takes 320 "\
            "mana to convince these creatures but they cannot be summoned. In addition, they are able to sense "\
            "invisible creatures.\nElves yield 42 experience points. They carry gold coins, leather boots, "\
            "longswords, plums, studded helmets and sometimes other items with them."
        end
        it "don't create entry on database neither schedule notification job" do
          # rubocop:disable Layout/LineLength(RuboCop)
          VCR.use_cassette("app/jobs/web_crawlers/tibia_creature_library/check_creature_library_entry_for_changes_job.rb") do
            # rubocop:enable Layout/LineLength(RuboCop)
            expect { call }
              .to(
                change(Monster, :count).by(0),
                change(CreatureLibraryEntry, :count).by(0),
              )

            expect(WebCrawlers::TibiaCreatureLibrary::NotifyLibraryEntryDescriptionChangeJob)
              .not_to(have_been_enqueued)
          end
        end
      end

      context "when description doesn't match" do
        let(:description) { "Simply does not match" }
        it "don't create entry on database but schedules notification job" do
          # rubocop:disable Layout/LineLength(RuboCop)
          VCR.use_cassette("app/jobs/web_crawlers/tibia_creature_library/check_creature_library_entry_for_changes_job.rb") do
            # rubocop:enable Layout/LineLength(RuboCop)
            expect { call }
              .to(
                change(Monster, :count).by(0),
                change(CreatureLibraryEntry, :count).by(0),
              )

            expect(WebCrawlers::TibiaCreatureLibrary::NotifyLibraryEntryDescriptionChangeJob)
              .to(have_been_enqueued)
          end
        end
      end
    end
  end
end
