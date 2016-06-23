get '/votes/new' do
binding.pry
end


post '/votes/new' do
  if logged_in?
    @vote = current_user.votes.new(value: params[:value].to_i,
     votable_id: params[:votable_id].to_i,
     votable_type: params[:votable_type] )
    if @vote.save
      redirect "/posts/#{params[:votable_id]}"
    else
        redirect "/posts/#{params[:votable_id]}"
    end
  else
    redirect "/posts/#{params[:votable_id]}"
  end
end
