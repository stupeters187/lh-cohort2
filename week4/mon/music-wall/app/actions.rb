# Homepage (Root path)
get '/songs' do
  @songs = Song.all
  erb :'songs/index'
end

post '/songs' do
  @song = Song.new(
    title: params[:title],
    artist: params[:artist],
    url: params[:url]
    )
  if @song.save
    redirect '/songs'
  else
    erb :'/songs/new'
  end
end

get '/songs/new' do
  erb :'/songs/new'
end

get '/songs/:id' do
  @song = Song.find params[:id]
  erb :'/songs/show'
end