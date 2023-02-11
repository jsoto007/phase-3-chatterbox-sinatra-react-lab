class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  use Rack::JSONBodyParser

  get '/messages' do 
    messages = Message.all.order(:created_at)
    messages.to_json
  end 
  
  post '/messages' do 
    message = Message.create(
      username: params[:username],
      body: params[:body]
    )
    message.to_json
  end 

  patch '/messages/:id' do
    message = Message.find(params[:id]).update(
      body: params[:body]
    )
    message.to_json
  end 

  delete '/message/:id' do
    message = Message.find(params[:id])
    message.destroy
  end 
  
end
