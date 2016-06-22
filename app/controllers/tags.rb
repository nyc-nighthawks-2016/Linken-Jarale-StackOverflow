get '/tags/new' do
  erb :'/tags/new'
end

post '/tags' do
  post = Post.new(params[:post])
  if post.save
    redirect '/tags/:id'
  else
    @errors = post.errors.full_messages
    erb :'/tags/new'
  end
end

get '/tags/:id' do
  @tags = Tag.find(params[:id])
  erb :'/tags/show'
end
