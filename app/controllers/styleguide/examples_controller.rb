module Styleguide
  class ExamplesController < ApplicationController
    helper Rails.application.helpers
    helper Rails.application.routes.url_helpers

    def show
      render inline: Base64.urlsafe_decode64(params[:example]), layout: "styleguide/example"
    end
  end
end
