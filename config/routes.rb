Rails.application.routes.draw do

  root 'users#show'

  get "/auth/github", as: :github_login

  get "/auth/github/callback", to: "sessions#create"
  
end
