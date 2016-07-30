class User < ActiveRecord::Base

	has_many :statuses
	has_many :likes

  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

	validates :email, uniqueness: {message: "already registered!"}
	validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => "invalid"}
	validates :password, :format => {:with => /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}\z/, :message => "At least 8 characters required!"}


	has_secure_password 

	def added_friends #both friends whom I added and who added me
		friend_array =[]
		inverse_friend_array = []
		self.friends.each do |friend|
			friend_array << friend
		end

		self.inverse_friends.each do |inverse_friend|
			inverse_friend_array << inverse_friend
		end

		@total_friends_array = friend_array + inverse_friend_array

	end

	def non_friends
		total_users = []

		User.all.each do |u|
			total_users << u			
		end


		non_friends_array = total_users - @total_friends_array


	end



end
