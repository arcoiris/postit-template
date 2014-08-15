class Post < ActiveRecord::Base
	has_many :post_categories 
	has_many :categories, through: :post_categories
	has_many :comments
	has_many :votes, as: :voteable
	belongs_to :creator, foreign_key: 'user_id', class_name: 'User'

	validates :title, presence: :true, length: { minimum: 5 }
	validates :url, presence: :true, uniqueness: true
	validates :description, presence: :true


	def total_votes
		up_votes - down_votes
	end

	def up_votes 
		self.votes.where(vote: true).size
	end

	def down_votes 
		self.votes.where(vote: false).size
	end
end