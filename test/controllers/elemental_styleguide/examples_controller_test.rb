# frozen_string_literal: true

require "test_helper"

module ElementalStyleguide
  class ExamplesControllerTest < ActionDispatch::IntegrationTest
    test "show renders signed example" do
      signed_example = ElementalStyleguide.message_verifier.generate("<p>Hello from signed example</p>")

      get "/styleguide/example", params: { example: signed_example }

      assert_response :success
      assert_includes response.body, "<p>Hello from signed example</p>"
    end

    test "show responds forbidden when example is not signed" do
      get "/styleguide/example", params: { example: "not-signed" }

      assert_response :forbidden
    end
  end
end
