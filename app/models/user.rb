class User < ApplicationRecord
    def self.authenticate(email, password)
        user = find_by_email(email)
        return nil if user.nil?
        return user if user.has_password?(password)
    end

    has_secure_password

    validates :email, presence: true, uniqueness: true
    validates :name, presence: true
end
