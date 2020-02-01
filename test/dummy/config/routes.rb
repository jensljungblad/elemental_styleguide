# frozen_string_literal: true

Rails.application.routes.draw do
  mount ElementalStyleguide::Engine => "/styleguide"

  resources :users, only: :show
end
