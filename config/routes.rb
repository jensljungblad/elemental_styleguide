# frozen_string_literal: true

Styleguide::Engine.routes.draw do
  root to: "pages#show"
  get "example", to: "examples#show", as: :example
  get "*path", to: "pages#show", as: :page
end
