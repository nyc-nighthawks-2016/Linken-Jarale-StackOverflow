get '/comments/new' do
  # binding.pry
  erb :'/comments/new'
end

post '/comments' do
    @post = Post.find(params[:post_id])
    @comment = post.comments.new(content:params[:content],user_id:current_user.id)
    if @comment.save
      redirect "/comments/#{@comment.id}"
    else
      @errors = post.errors.full_messages
      erb :'/comments/new'
    end
end

get '/comments/:id' do
  erb :'/comments/show'
end
