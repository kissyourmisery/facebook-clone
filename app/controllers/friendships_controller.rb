require 'byebug'

post '/friendships' do

	current_user.friendships.create(:friend_id => params[:friend_id])
	redirect '/'
end

post '/destroyfriendships' do

	if current_user.friends.where(id: params[:friend_id]) == []

		friendship_to_be_destroyed =Friendship.where(friend_id: params[:current_user_id], user_id: params[:friend_id]).first
		Friendship.destroy(friendship_to_be_destroyed.id)

	else

		friendship_to_be_destroyed= Friendship.where(user_id: params[:current_user_id], friend_id:params[:friend_id]).first
		Friendship.destroy(friendship_to_be_destroyed.id)

	end
redirect '/'
end