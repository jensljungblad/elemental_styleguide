# frozen_string_literal: true

module ElementalStyleguide
  class Engine < ::Rails::Engine
    isolate_namespace ElementalStyleguide

    initializer "elemental_styleguide.template_hander" do
      ActionView::Template.register_template_handler :md, ElementalStyleguide::MarkdownHandler
    end
  end
end
