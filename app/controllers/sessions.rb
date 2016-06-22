get '/session/login' do
  erb :'/session/login'
end

post '/session' do

end

get '/session/logout' do
  session.clear
  redirect '/posts'
end
