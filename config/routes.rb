Rails.application.routes.draw do
  devise_for :users
  resources :beers do
    member { post :vote }
  end


 
  root 'beers#index'

end
