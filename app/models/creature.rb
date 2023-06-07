# frozen_string_literal: true

class Creature < ApplicationRecord
  validates :name, presence: true

  belongs_to :user, optional: true
  has_one :creature_library_entry
end
