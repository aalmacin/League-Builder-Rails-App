Jba::Application.routes.draw do
  root :to => "welcome#home"

  resources :players
end
