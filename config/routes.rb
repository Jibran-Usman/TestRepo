Rails.application.routes.draw do
  devise_for :users
  get 'welcome/Index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  concern :commentable do
  	resources :comments
  end

  resources :articles, concerns: :commentable do
  	collection do
  		get 'populate'
  	end
  end

  root 'welcome#Index'
end
