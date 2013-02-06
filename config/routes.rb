Jba::Application.routes.draw do
  root :to => "welcome#home"

  get 'players' => "players#index"
  get 'games' => "games#index"
  get 'teams' => "teams#index"
  get 'champions' => "champions#index"
end
