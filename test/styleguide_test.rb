# frozen_string_literal: true

require "test_helper"

class StyleguideTest < ActiveSupport::TestCase
  # rubocop:disable Style/WordArray
  test "#page_names returns a hash of page names" do
    assert_equal [
      ["01_home", "Home"],
      ["02_pages", "Pages", [
        ["01_page_one", "Page One"],
        ["02_page_two", "Page Two"]
      ]],
      ["03_examples", "Examples", [
        ["01_example_one", "Example One"],
        ["02_example_two", "Example Two"]
      ]]
    ], Styleguide.page_names
  end
  # rubocop:enable Style/WordArray
end
