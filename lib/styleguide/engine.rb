# frozen_string_literal: true

module Styleguide
  class Engine < ::Rails::Engine
    isolate_namespace Styleguide

    initializer "styleguide.template_hander" do
      ActionView::Template.register_template_handler :md, Styleguide::MarkdownHandler
    end
  end
end
