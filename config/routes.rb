Rails.application.routes.draw do
  root 'application#hello'

  get "posts/index" => "posts#index"
  get "posts/:id" => "posts#show"

  get "/" => "home#top"
  get "about" => "home#about"


end
