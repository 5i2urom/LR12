# frozen_string_literal: true

class User < ApplicationRecord
  include ActiveModel::Serializers::Xml

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
