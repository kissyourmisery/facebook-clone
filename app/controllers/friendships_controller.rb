post '/friendships' do

	current_user.friendships.create(:friend_id => params[:friend_id])
	redirect '/'
end