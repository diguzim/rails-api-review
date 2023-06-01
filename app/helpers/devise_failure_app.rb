# frozen_string_literal: true

class DeviseFailureApp < Devise::FailureApp
  def respond
    self.status        = 401
    self.content_type  = "application/json"
    self.response_body = { errors: [{ status: "401", title: i18n_message }] }.to_json
  end
end
