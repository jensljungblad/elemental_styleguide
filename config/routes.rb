# frozen_string_literal: true

ElementalStyleguide::Engine.routes.draw do
  root to: "pages#show"
  get "example", to: "/styleguide/examples#show", as: :example
  get "*path", to: "pages#show", as: :page
end
