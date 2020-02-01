# frozen_string_literal: true

module ElementalStyleguide
  class PagesController < ApplicationController
    helper ElementalStyleguide::NavigationHelper

    def show
      unless params[:path]
        params[:path] = ElementalStyleguide.page_names[0][0]
      end
      render "styleguide/#{params[:path]}", layout: "elemental_styleguide/application"
    end
  end
end
