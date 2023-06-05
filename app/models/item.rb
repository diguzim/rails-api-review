# frozen_string_literal: true

class Item < ApplicationRecord
  validates :name, presence: true

  belongs_to :user
end
