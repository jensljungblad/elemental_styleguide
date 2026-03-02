# frozen_string_literal: true

module ElementalStyleguide
  class ExamplesController < ApplicationController
    layout "styleguide/example"

    def show
      @code = ElementalStyleguide.message_verifier.verify(params[:example])
    rescue ActiveSupport::MessageVerifier::InvalidSignature
      head :forbidden
    end
  end
end
