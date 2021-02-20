Rails.application.routes.draw do
  resources :posts, only: %i[index create new show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
