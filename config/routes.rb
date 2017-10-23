Rails.application.routes.draw do
  get '/change', action: :show, controller: 'change'
  post '/make_change', action: :create, controller: 'change'
  get '/', action: :index, controller: 'change'
end
