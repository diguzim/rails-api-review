# frozen_string_literal: true

class Creature < ApplicationRecord
  validates :name, presence: true

  belongs_to :user, optional: true
  has_one :creature_library_entry

  after_create :notify_creature_creation

  def notify_creature_creation
    Notifications::NotifyAdminAboutCreatureCreationJob.perform_later(self)
  end
end
