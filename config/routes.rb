Rails.application.routes.draw do
  root to: 'pages#home'
  post '/login', to: 'login#login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    namespace :api, defaults: { format: :json } do
    namespace :v1 do
    put "/login", to: "login#login"
    resources :users, only: [:index, :show, :create]
    resources :courses, only: [:index, :show]
    resources :answers, only: [:show, :create]
    #   # /answers/:id/questions
    #   resources :questions
    #   # /answers/:id/choices
    #   resources :choices
    end
  end
end

