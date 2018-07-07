Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'landing#index'

  get 'describe', to: 'landing#describe', as: :describe
  get 'showcase', to: 'landing#showcase', as: :showcase
  get 'neighbors', to: 'landing#neighbors', as: :neighbors
  get 'help', to: 'landing#help', as: :help
end
