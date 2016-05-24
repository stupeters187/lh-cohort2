
enable :sessions

helpers do

  def current_user
    User.find_by(email: session["email"]) if session["email"]
  end

end

get '/songs' do
  @songs = Song.all
  erb :'songs/index'
end

post '/songs' do
  if current_user
    @song = Song.create(
      user: current_user, 
      title: params[:title], 
      artist: params[:artist], 
      url: params[:url]
    )
    if @song.save
      redirect '/songs'
    else
      erb :'/songs/new'
    end
  else
  end
end

post '/reviews' do
  @review = Review.create(
    user_id: current_user.id,
    song_id: params[:id],
    review: params[:review]
    )
  if @review.save
    redirect '/songs'
  end
end

get '/songs/new' do
  erb :'/songs/new'
end

get '/signup' do
  erb :'/signup'
end

post '/login' do
  @user = User.find_by(email: params[:email], password: params[:password])
  if @user.nil?
    redirect '/songs'
  else
    session["email"] = @user.email
    redirect '/songs'
  end
end

get '/logout' do
  session.clear
  redirect '/songs'
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
