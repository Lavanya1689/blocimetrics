Rails.application.routes.draw do

  resources :registered_applications do
    resources :events, only: [:create, :destroy]
  end

  devise_for :users

  get 'about' => 'welcome#about'

  root 'welcome#index'
end
