# frozen_string_literal: true

module Styleguide
  class InstallGenerator < Rails::Generators::Base
    desc "Install style guide"

    source_root File.expand_path("templates", __dir__)

    def create_style_guide
      directory "install", "app"
    end
  end
end
