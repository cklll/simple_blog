require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq"

  resources :posts, only: %i[index create new show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
