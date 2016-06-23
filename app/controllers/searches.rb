post '/searches' do
  @search_words = params[:search].split
  erb :'/searches/new'
end
