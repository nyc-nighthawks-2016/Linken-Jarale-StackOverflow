get '/user/new' do
  erb :'/users/new'
end

post '/user/new' do
  User.create(params[:user])
  redirect '/'
end
