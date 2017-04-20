Rails.application.routes.draw do

  #  Customized devise controller (not using it, was not workng, to be removed)
  #devise_for :users, :controllers => { registrations: 'registrations' }

  devise_for :users, :controllers => { :registrations => "user_registrations" }
  resources :users
  # resources :users

  resources :articles do
  	resources :comments
	end

  get 'my_blog/index'
  get 'my_blog/contact'
  get 'my_blog/about'

	get 'articles/new'
	get 'articles/index'
	get 'comments/index'

  post 'my_blog/thank_you'

  root 'my_blog#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
