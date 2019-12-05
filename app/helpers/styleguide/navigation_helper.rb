# frozen_string_literal: true

module Styleguide
  module NavigationHelper
    # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    def navigation(pages = nil, paths = [])
      content_tag :ul do
        (pages || Styleguide.page_names).map do |page|
          path, label, children = page
          path = paths.dup << path

          content_tag :li do
            if children
              [label, navigation(children, path)].join("").html_safe
            else
              link_to label, styleguide.page_path(path)
            end
          end
        end.join("").html_safe
      end
    end
    # rubocop:enable Metrics/AbcSize, Metrics/MethodLength
  end
end
