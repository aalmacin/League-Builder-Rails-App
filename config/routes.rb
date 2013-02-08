Jba::Application.routes.draw do
  get "champions/index"

  get "games/index"

  get "teams/index"

  resources :players


  root :to => "welcome#home"

  get 'players' => "players#index"
  get 'games' => "games#index"
  get 'teams' => "teams#index"
  get 'champions' => "champions#index"
end
