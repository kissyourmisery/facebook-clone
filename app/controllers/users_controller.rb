enable :sessions

get '/users/new' do
	@page = "register"
  erb :"user/new"
end

post '/users' do 

	user = User.new(params[:user])


	if user.save
		session[:id] = user.id 
		redirect "/"  
	else
		@error = user.errors.full_messages 
		erb '/users/new'	
	end
end

get '/users/:id' do
	if logged_in? 
		@user = User.find_by(id: params[:id])
		erb :'user/show'
	else
		@error = 'You are not logged in'
		erb :'/user/new'
	end
end

get '/users/:id/edit' do
	erb :'user/edit'
end

put '/users/:id' do
	current_user.update(params[:user])
	redirect to '/users/' + current_user.id.to_s
end




















