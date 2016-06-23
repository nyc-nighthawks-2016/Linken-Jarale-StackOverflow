post '/answers' do
  @post = Post.find(params[:post_id])
  answer = @post.answers.new(body:params[:body], user_id:current_user.id)

  if answer.save
    redirect "/posts/#{params[:post_id]}"
  else
    @errors = answer.errors.full_messages
    @answers = @post.answers
    erb :'posts/show'
  end
end
