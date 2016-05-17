
enable :sessions

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

get '/signup' do
  erb :'/signup'
end

post '/login' do
  user = User.find_by(email: params[:email], password: params[:password])
  if user.nil?
    redirect '/songs'
  else
    session["email"] = user.email
  end
end


post '/signup' do
  @new_user = User.new(
    username: params[:username],
    email: params[:email],
    password: params[:password]
    )
  if @new_user.save
    redirect '/songs'
  else
    erb :'/signup'
  end
end

get '/songs/:id' do
  @song = Song.find params[:id]
  erb :'/songs/show'
end
