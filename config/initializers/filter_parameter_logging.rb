# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

# Configure parameters to be filtered from the log file. Use this to limit dissemination of
# sensitive information. See the ActiveSupport::ParameterFilter documentation for supported
# notations and behaviors.
Rails.application.config.filter_parameters += [
  :passw,
  :secret,
  :token,
  :_key,
  :crypt,
  :salt,
  :certificate,
  :otp,
  :ssn,
  :password,
  :password_confirmation,
  :authorization_header,
  :authorization,
  :access_token,
  :refresh_token,
  :client_id,
  :client_secret,
  :api_key,
]
