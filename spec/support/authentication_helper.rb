# frozen_string_literal: true

RSpec.shared_context("authentication_helper") do
  include Devise::Test::ControllerHelpers

  def add_authentication_header(user)
    headers = Devise::JWT::TestHelpers.auth_headers({}, user)
    request.headers.merge!(headers)
  end
end
