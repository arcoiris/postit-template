class User < ActiveRecord::Base
	include Sluggable
	has_many :comments
	has_many :posts
	has_many :votes 
	
	has_secure_password validations: false
	validates :username, presence: true, uniqueness: true
	validates :password, presence: true, length: { minimum: 6 }, on: :create

	sluggable_column :username
end