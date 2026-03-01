# frozen_string_literal: true

module ElementalStyleguide
  module NavigationHelper
    # rubocop:disable Metrics/AbcSize
    # rubocop:disable Metrics/MethodLength
    def navigation(pages = nil, paths = [], level: 0)
      content_tag :ul, class: "nav flex-column ms-#{level * 2}" do
        (pages || ElementalStyleguide.page_names).map do |page|
          path, label, children = page
          path = paths.dup << path

          content_tag :li, class: "nav-item" do
            if children
              content_tag(:span, label.html_safe, class: "nav-link disabled py-1") +
                navigation(children, path, level: level + 1)
            else
              link_to label, elemental_styleguide.page_path(path), class: "nav-link py-1"
            end
          end
        end.join.html_safe
      end
    end
    # rubocop:enable Metrics/MethodLength
    # rubocop:enable Metrics/AbcSize
  end
end
