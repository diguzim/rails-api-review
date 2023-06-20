# frozen_string_literal: true

module Notifications
  class NotifyAdminAboutCreatureCreationJob < ApplicationJob
    def perform(creature)
      puts "Notifying admin about creature creation..."
    end
  end
end
