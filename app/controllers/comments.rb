get '/comments/new' do
  erb :'/comments/new'
end

post '/comments' do
    comment = Comment.new(params)
    if comment.save
      redirect '/'
    # else
    #   @errors = post.errors.full_messages
    #   erb :'/comments/new'
  end
end
