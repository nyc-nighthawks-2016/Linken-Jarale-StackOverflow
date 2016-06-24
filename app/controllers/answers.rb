post '/answers' do
  # binding.pry
  @post = Post.find(params[:post_id])
  @answer = @post.answers.new(body:params[:body], user_id:current_user.id)

  if @answer.save
    if request.xhr?
      erb :'/partials/_answer',layout: false, locals: {answer: @answer, post: @post}
    else
      redirect "/posts/#{params[:post_id]}"
    end
  else
    @errors = answer.errors.full_messages
    erb :'posts/show'
  end
end
