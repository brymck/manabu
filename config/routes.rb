Manabu::Application.routes.draw do
  scope "(:locale)", :locale => /en|ja/ do
    # Generic resources
    resources :questions

    match "about" => "pages#about"
  end

  # Default path for each locale
  match '/:locale' => 'pages#home', :as => :home

  # Redirects to appropriate home path
  root :to => "pages#root"
end
