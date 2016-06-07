# Homepage (Root path)
get '/' do
  erb :index
end

post '/search' do

end



post '/new' do
  @contact = Contact.new(
    first_name: params[:first_name],
    last_name: params[:last_name],
    email: params[:email],
    phone_number: params[:phone_number]
    ) 
end

get '/list' do
  contacts = Contact.all.to_json
end

get '/find' do
  contact = Contact.find_by(id: params[:id]).to_json
end


