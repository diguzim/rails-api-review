# frozen_string_literal: true

require "nokogiri"
require "open-uri"

class MonstersCrawlerJob < ApplicationJob
  queue_as :default

  def perform(*args)
    url = "https://www.tibia.com/library/?subtopic=creatures"
    doc = Nokogiri::HTML(URI.open(url))

    # TODO: add validation to the presence of exactly one entry for an element with such a class
    creature_elements = doc.css(".Creatures > div")

    creature_elements.each do |creature_div_element|
      name_div = creature_div_element.css("div")
      puts name_div.text
    end
  end
end
