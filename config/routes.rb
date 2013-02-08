Jba::Application.routes.draw do
  root :to => "welcome#home"
  resources :players

  get 'games' => "games#index"
  get 'teams' => "teams#index"
  get 'champions' => "champions#index"
  get 'login' => "sessions#new"

  match 'admin' => "admin#index"
  match 'confirm_admin' => "admin#confirm"
  match 'update_admin' => "admin#update"
  match "create_session" => "sessions#create"
  match "logout" => "sessions#destroy"
end
