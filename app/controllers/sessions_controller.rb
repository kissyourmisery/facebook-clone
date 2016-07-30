enable :sessions

get '/sessions/new' do
	@page = "login"
	erb :"session/new"
end

post '/sessions/new' do

	user = User.find_by(email: params[:user][:email])
	if user && user.authenticate(params[:user][:password])
		session[:id] = user.id
		redirect "/"
	else
		@error = 'Wrong email/password combo'
		erb :"session/new"
	end
end

post '/sessions/reset' do
	session[:id] = nil
	redirect '/'
end