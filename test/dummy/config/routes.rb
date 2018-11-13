Rails.application.routes.draw do
  mount Styleguide::Engine => "/styleguide"

  resources :users, only: :show
end
