Rails.application.routes.draw do
  get 'welcome/Index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  concern :commentable do
  	resources :comments
  end

  resources :articles, concerns: :commentable

  root 'welcome#Index'
end
