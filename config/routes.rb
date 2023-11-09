Rails.application.routes.draw do
  get 'chore/new'
  get 'chore/index'
  get 'chore/create'
  get 'chore/:id', to: 'chore#show'
  get 'chore/edit'
  get 'chore/delete'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
