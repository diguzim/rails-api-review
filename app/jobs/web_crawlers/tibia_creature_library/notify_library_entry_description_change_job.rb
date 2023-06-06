# frozen_string_literal: true

require "nokogiri"
require "open-uri"

module WebCrawlers
  module TibiaCreatureLibrary
    class NotifyLibraryEntryDescriptionChangeJob < ApplicationJob
      queue_as :default

      def perform(creature_library_entry_id, new_description)
        creature_library_entry = CreatureLibraryEntry.find(creature_library_entry_id)
        monster = creature_library_entry.monster

        # Real implementation might notify through SMS, e-mail, etc

        puts "Creature #{monster.name} (race=#{creature_library_entry.race}) changed the description."
        puts "Old description was:\n#{creature_library_entry.description}"
        puts "New description is:\n#{new_description}"
      end
    end
  end
end
