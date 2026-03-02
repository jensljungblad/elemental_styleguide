# frozen_string_literal: true

module ElementalStyleguide
  class PagesController < ApplicationController
    def show
      unless params[:path]
        params[:path] = ElementalStyleguide.page_names[0][0]
      end
      render "styleguide/#{params[:path]}"
    end
  end
end
