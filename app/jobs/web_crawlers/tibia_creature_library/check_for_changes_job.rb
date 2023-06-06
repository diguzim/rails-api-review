# frozen_string_literal: true

require "nokogiri"
require "open-uri"

module WebCrawlers
  module TibiaCreatureLibrary
    class CheckForChangesJob < ApplicationJob
      queue_as :default

      def perform(*args)
        url = "https://www.tibia.com/library/?subtopic=creatures"
        # rubocop:disable Security/Open(RuboCop)
        doc = Nokogiri::HTML(URI.open(url))
        # rubocop:enable Security/Open(RuboCop)

        creature_div_elements = doc.css(".Creatures > div")

        creature_div_elements.each do |creature_div_element|
          anchor_element = creature_div_element.css("a")
          url = anchor_element.attribute("href").value

          race = url.match(/creatures&race=(.+)$/)[1]

          CheckCreatureLibraryEntryForChangesJob.perform_async(race)
        end

        nil
      end
    end
  end
end
