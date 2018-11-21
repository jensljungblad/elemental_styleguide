require "test_helper"
require_relative "../../lib/generators/styleguide/install_generator"

class InstallGeneratorTest < Rails::Generators::TestCase
  tests Styleguide::InstallGenerator
  destination File.expand_path("../tmp", __dir__)
  setup :prepare_destination

  test "install generator" do
    run_generator
    assert_file "app/views/layouts/styleguide/example.html.erb"
    assert_file "app/views/styleguide/01_home.md"
  end
end
