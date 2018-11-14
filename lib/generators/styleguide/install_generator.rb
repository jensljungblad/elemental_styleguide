module Styleguide
  class InstallGenerator < Rails::Generators::Base
    desc "Install style guide"

    source_root File.expand_path("../templates", __FILE__)

    def create_style_guide
      directory "install", "app"
    end
  end
end
