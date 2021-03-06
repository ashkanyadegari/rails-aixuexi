Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'pages#home'
  post '/login', to: 'login#login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    namespace :api, defaults: { format: :json } do
    namespace :v1 do
    put "/login", to: "login#login"
    resources :users, only: [:index, :show, :create, :update]
    resources :courses, only: [:index, :show, :create, :destroy, :update]
    resources :answers, only: [:show, :create]
    resources :questions, only: [:index ]
    resources :chapters
    post "/useranswer", to: "questions#useranswer"
    get "/useranswer", to: "questions#getresult"
    post "/joincourse", to: "courses#joincourse"
    get "/getusercourses", to: "courses#getusercourses"
    get "/getcolleagues", to: "companies#getcolleagues"
    get "/getcompany", to: "companies#getcompany"
    get "/userstats", to: "courses#userstats"
    # get "/questions", to: "questions#actionname"
    # resrouces :
    #   # /answers/:id/questions
    #   resources :questions
    #   # /answers/:id/choices
    #   resources :choices
    end
  end
  resources :courses do
    resources :questions
  end

  resources :questions do
    resources :choices
  end
end

