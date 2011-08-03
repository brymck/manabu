Manabu::Application.routes.draw do
  # Generic resources
  resources :answers, :questions

  match "about" => "pages#about"

  root :to => "pages#index"
end
