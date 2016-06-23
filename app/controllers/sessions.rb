get '/session/login' do
  erb :'/session/login'
end

post '/session' do
  user = User.find_by(display_name: params[:user][:display_name])
  if user.authenticate(params[:user][:password])
    session['user_id'] = user.id
    redirect '/posts'
  else
    errors = ["Display Name or Password invalid"]
    erb :'/session/login'
  end
end

get '/session/logout' do
  session.clear
  redirect '/posts'
end
