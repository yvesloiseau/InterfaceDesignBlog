Rails.application.routes.draw do
  resources :articles do
  	resources :comments
	end

  	get 'my_blog/index'
	get 'articles/new'
	get 'articles/index'
	get 'comments/index'

  resources :articlecomments

	get 'articlecomments/index'
	get 'articlecomments/new'

  root 'my_blog#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
