require "redcarpet"
require "rouge"
require "rouge/plugins/redcarpet"
require "styleguide/markdown_handler"
require "styleguide/markdown_renderer"
require "styleguide/engine"

module Styleguide
  def self.pages_path
    Rails.root.join("app", "styleguide", "pages")
  end

  def self.page_names(path = nil)
    Dir.chdir(path || pages_path) do
      Dir.glob("*").sort.map do |item|
        [
          item.sub(/\..*/, ""),
          item.sub(/\..*/, "").sub(/[0-9]*_?/, "").titleize
        ].tap do |array|
          array << page_names(item) if File.directory?(item)
        end
      end
    end
  end
end
