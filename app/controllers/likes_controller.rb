post '/:id/liked' do

	@status = Status.find(params[:id])


	current_user.likes.create(status_id: params[:id])
	erb :"status/show"
	
end

post '/:id/unliked' do

	@status = Status.find(params[:id])
	id_of_that_like = current_user.likes.where(status_id: @status.id)

	Like.destroy(id_of_that_like)
	erb :"status/show"
	
end




