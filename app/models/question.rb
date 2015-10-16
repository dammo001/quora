class Question < ActiveRecord::Base
	validates :title, :user_id, presence: true 
	belongs_to :author,
	class_name: "User",
	foreign_key: :user_id, 
	primary_key: :id
	has_many :answers

	has_many :taggings
	has_many :tags, through: :taggings

	def self.find_by_substring(str)
		Question.limit(5).where("LOWER(title) LIKE '%#{str.downcase}%'")
	end


end
