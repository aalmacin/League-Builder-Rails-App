Jba::Application.routes.draw do
  root :to => "welcome#home"

  resources :players

  get 'players' => "players#index"
  get 'games' => "games#index"
  get 'teams' => "teams#index"
  get 'champions' => "champions#index"
  get 'login' => "sessions#new"

  match "create_session" => "sessions#create"
  match "logout" => "sessions#destroy"
end
