get '/posts' do
  erb :'/posts/index'
end

get '/posts/new' do
  erb :'/posts/new'
end

post '/posts' do
  post = Post.new(params[:post])
  if post.save
    redirect '/posts/:id'
  else
    @errors = post.errors.full_messages
    erb :'/posts/new'
  end
end

get '/posts/:id' do
  @post = Post.find(params[:id])
  erb :'/posts/show'
end
