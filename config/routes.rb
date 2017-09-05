Rails.application.routes.draw do
  resources :links
  get ':token' => 'links#show'

  root 'links#index'
end
