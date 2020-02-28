# frozen_string_literal: true

module ElementalStyleguide
  class Engine < ::Rails::Engine
    isolate_namespace ElementalStyleguide

    initializer "elemental_styleguide.template_hander" do
      if Rails::VERSION::MAJOR < 6
        ActionView::Template.register_template_handler :md, ElementalStyleguide::MarkdownHandlerRails5
      else
        ActionView::Template.register_template_handler :md, ElementalStyleguide::MarkdownHandlerRails
      end
    end
  end
end
