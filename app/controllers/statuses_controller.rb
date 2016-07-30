get '/statuses/new' do 
	erb :"status/new"
end

get '/statuses/:id' do
	@status = Status.find(params[:id])
	erb :"status/show"
end

post '/statuses' do 
	status = Status.create(status_text: params[:status], user_id: current_user.id)
	redirect "/" 
end

get '/statuses/:id/edit' do
	@status = Status.find(params[:id])
	erb :"status/edit"
end

put '/statuses/:id' do
	status = Status.find(params[:id])
	status.update(params[:status])
	redirect to '/statuses/' + status.id.to_s
end

get '/statuses/:id/delete' do
	@status = Status.find(params[:id])
	erb :"status/delete"
end

delete '/statuses/:id' do

	status = Status.find(params[:id])
	@user = User.find(status.user_id)
	status.likes.each do |like|
		like.destroy
	end
	status.destroy
	erb :"user/show"
end