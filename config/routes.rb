Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get 'player1', to: "pages#player1"
  get 'player2', to: "pages#player2"
  get 'reset', to: "pages#reset"
  root "pages#home"
end
