get '/posts' do

  erb :'/posts/index'
end

get '/posts/new' do
  erb :'/posts/new'
end

post '/posts' do
  post = current_user.posts.new(params[:post])
  tags = params[:tags].split()
  tags.each do |tag|
    current_user.posts.find_or_create_by(name: tag)
  end
  if post.save
    redirect '/posts/#{post.id}'
  else
    @errors = post.errors.full_messages
    erb :'/posts/new'
  end
end

get '/posts/:id' do
  @post = Post.find(params[:id])
  @post.views += 1
  @post.save
  @answer = @post.answers
  erb :'/posts/show'
end
