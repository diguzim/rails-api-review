# frozen_string_literal: true

class Monster < ApplicationRecord
  validates :name, presence: true

  belongs_to :user
end
