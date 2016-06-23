post '/answers' do
  if request.xhr?
    @post = Post.find(request[:post_id])
    answer = @post.answers.new(body:request[:body], user_id:current_user.id)
    if answer.save
      erb :'/partials/_answer',layout: false, locals: {answer: answer, post: @post}
    else
      status 422
    end
  else
    @post = Post.find(params[:post_id])
    answer = @post.answers.new(body:params[:body], user_id:current_user.id)
    if answer.save
      redirect "/posts/#{params[:post_id]}"
    else
      @errors = answer.errors.full_messages
      erb :'posts/show'
    end

  end
end
