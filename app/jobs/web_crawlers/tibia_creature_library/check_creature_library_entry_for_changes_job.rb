# frozen_string_literal: true

require "nokogiri"
require "open-uri"

module WebCrawlers
  module TibiaCreatureLibrary
    class CheckCreatureLibraryEntryForChangesJob < ApplicationJob
      queue_as :default

      def perform(race)
        url = "https://www.tibia.com/library/?subtopic=creatures&race=#{race}"
        # rubocop:disable Security/Open(RuboCop)
        doc = Nokogiri::HTML(URI.open(url))
        # rubocop:enable Security/Open(RuboCop)

        name_and_description = doc.css("#creatures > .Border_2 > .Border_3 > .BoxContent > :nth-child(2)")

        pluralized_name = name_and_description.css(":nth-child(1) > h2").text
        description_paragraphs = name_and_description.css(":nth-child(2) > p")

        description = description_paragraphs.map(&:text).join("\n")

        # Check for existing database entry based on race

        existing_creature_library_entry = CreatureLibraryEntry.find_by(race: race)

        if existing_creature_library_entry
          if existing_creature_library_entry.description != description
            NotifyLibraryEntryDescriptionChangeJob.perform_async(existing_creature_library_entry.id, description)
          end
        else
          monster = Monster.create!({ name: pluralized_name })

          CreatureLibraryEntry.create!(
            race:,
            pluralized_name:,
            description:,
            monster:,
          )
        end
      end
    end
  end
end
