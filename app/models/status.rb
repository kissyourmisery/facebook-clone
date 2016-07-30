class Status < ActiveRecord::Base


	belongs_to :user
	has_many :likes

	validates :status_text, :length => { maximum: 140, too_long: "140 characters is the maximum allowed" }


	def count_likes
		self.likes.count
	end

end