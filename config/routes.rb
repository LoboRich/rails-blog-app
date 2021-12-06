Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :articles do
    resources :comments
    resources :categories
  end

  resources :categories do
    resources :articles
  end 
  root 'articles#index'
end
