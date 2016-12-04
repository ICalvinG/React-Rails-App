Rails.application.routes.draw do
  resources :giphies

  root 'giphies#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
