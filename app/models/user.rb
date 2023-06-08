# frozen_string_literal: true

class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable,
    :registerable,
    :jwt_authenticatable,
    jwt_revocation_strategy: self

  validates :email, presence: true, format: { with: Devise.email_regexp }

  validates :password, presence: true

  has_many :creatures
  has_many :items
end
