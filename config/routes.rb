Rails.application.routes.draw do

  resources :foods do
    resources :recipes do 
      resources :recipe_details
    end
  end

  resources :categories
  resources :units
  resources :materials

  resources :users, param: :_username
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'

end
