module Styleguide
  class PagesController < ApplicationController
    prepend_view_path "app/styleguide"

    def show
      unless params[:path]
        params[:path] = Styleguide.page_names[0][0]
      end
      render "pages/#{params[:path]}"
    end
  end
end
