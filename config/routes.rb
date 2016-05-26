Rails.application.routes.draw do

  root 'welcome#show', as: :root

  get "/users/:id", to: "users#show", as: :user

  get "/auth/github", as: :github_login

  get "/followers", to: "followers#index", as: :followers
  get "/following", to: "following#index", as: :following
  get "/data", to: "data#index", as: :data


  get "/auth/github/callback", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: :logout
end
