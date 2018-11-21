module Styleguide
  class PagesController < ApplicationController
    helper Styleguide::NavigationHelper

    def show
      unless params[:path]
        params[:path] = Styleguide.page_names[0][0]
      end
      render "styleguide/#{params[:path]}", layout: "styleguide/application"
    end
  end
end
