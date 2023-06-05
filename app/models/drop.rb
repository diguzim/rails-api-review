# frozen_string_literal: true

class Drop < ApplicationRecord
  belongs_to :item
  belongs_to :monster
end
