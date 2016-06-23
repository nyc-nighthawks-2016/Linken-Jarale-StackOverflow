get '/votes/new' do

end


post '/votes/new' do
  if logged_in?
    @vote = current_user.votes.new(value: params[:value].to_i,
     votable_id: params[:votable_id].to_i,
     votable_type: params[:votable_type] )
    if @vote.save
      redirect "/posts/#{params[:post_id]}"
    else
        redirect "/posts/#{params[:post_id]}"
    end
  else
    redirect "/posts/#{params[:post_id]}"
  end
end
