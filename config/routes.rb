Manabu::Application.routes.draw do
  get "sessions/new"

  scope ":locale", :locale => /en|ja/ do
    # Generic resources
    resources :questions, :users

    match "about" => "pages#about"
    match "privacy" => "pages#privacy"
    match "login" => "sessions#new", :as => :login

    # Default path
    match "/" => "exams#index", :as => :home

    # Setup routes that would otherwise be missed
    resources :exams, :only => [:index, :show, :new, :create, :edit], :path => '/'

    # Setup basic exam resources and hold some back
    resources :exams, :except => [:index, :show, :new, :create, :edit], :path => '/' do
      resources :levels, :path => '/'
    end

    # Clean URLs for exams
    match ":exam_id/:id", :as => :level,
                          :via        => :get,
                          :controller => :levels,
                          :action     => :show

    # Clean URLs for levels
    match ":exam_id", :as         => :exam,
                      :via        => :get,
                      :controller => :exams,
                      :action     => :show
  end

  # Authentication
  match "/auth/:provider/callback" => "sessions#create", :as => :auth
  match "/auth/failure" => "sessions#failure"
  match "/logout" => "sessions#destroy", :as => :logout

  # Redirects to appropriate home path
  root :to => "pages#root"
end
