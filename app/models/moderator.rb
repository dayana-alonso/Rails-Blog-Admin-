class Moderator < ApplicationRecord
	has_secure_password

	has_many :post

	validates :fullname, presence: true
	validates :username, presence: true, format: {with: /@/, message: "is not valid"}
	validates :password, presence: true
end

