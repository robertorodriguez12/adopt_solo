Rails.application.routes.draw do
  get '/shelters', to: 'shelters#index'
  get '/shelters/new', to: 'shelters#new'
  get '/shelters/:id', to: 'shelters#show'
  # The order here had to be reversed BECAUSE - :id is a dynamic value
  post '/shelters', to: 'shelters#create'
end
