# frozen_string_literal: true

module ElementalStyleguide
  class ExamplesController < ApplicationController
    helper Rails.application.helpers
    helper Rails.application.routes.url_helpers

    def show
      render inline: Base64.urlsafe_decode64(params[:example]), layout: "elemental_styleguide/example"
    end
  end
end
