# frozen_string_literal: true

module ElementalStyleguide
  class ExamplesController < ApplicationController
    helper Rails.application.helpers
    helper Rails.application.routes.url_helpers

    def show
      code = ElementalStyleguide.message_verifier.verify(params[:example])
      render inline: code, layout: "styleguide/example"
    rescue ActiveSupport::MessageVerifier::InvalidSignature
      head :forbidden
    end
  end
end
