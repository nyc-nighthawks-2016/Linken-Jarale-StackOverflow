get '/posts' do

  erb :'/posts/index'
end

get '/posts/new' do
  @tags = Tag.all.sort{ |x,y| y.posts.length <=> x.posts.length }
  erb :'/posts/new'
end

post '/posts' do
  @post = current_user.posts.new(params[:post])
  @tags = params[:tags]
  @tags.map! { |tag| Tag.find_by(name:tag) }
  @post.tags << @tags
  if @post.save
    redirect "/posts/#{@post.id}"
  else
    @tags = Tag.all.sort{ |x,y| y.posts.length <=> x.posts.length }
    @errors = @post.errors.full_messages
    erb :'/posts/new'
  end
end

get '/posts/:id' do
  @post = Post.find(params[:id])
<<<<<<< dabef312fda7129d1fe110aca82b43ed0edf7bf1
  @post.views += 1
  @post.save
  @answer = @post.answers
=======
  @answers = @post.answers
>>>>>>> added upvote buttons to posts
  erb :'/posts/show'
end
