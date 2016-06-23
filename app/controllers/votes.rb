get '/votes/new' do

end


post '/votes/new' do
  if request.xhr?
    @vote = current_user.votes.new(value: request[:value].to_i,
      votable_id: request[:votable_id].to_i,
      votable_type: request[:votable_type])
    if @vote.save
      @vote.votable.points.to_s
    else
      status 422
    end
  else
    if logged_in?
      @vote = current_user.votes.new(value: params[:value].to_i,
       votable_id: params[:votable_id].to_i,
       votable_type: params[:votable_type] )
      if @vote.save
        redirect "/posts/#{params[:post_id]}"
      else
          redirect "/posts/#{params[:post_id]}"
      end
    end
  end
end
