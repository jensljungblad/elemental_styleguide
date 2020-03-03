# frozen_string_literal: true

module ElementalStyleguide
  # Support rails 5 template handlers by defining a proxy class without "source" parameter in .call signature.
  class MarkdownHandlerRails5
    class << self
      def call(template)
        # Forward method call to rails 6 compatible MarkdownHandler with additional, fake "source" parameter.
        ElementalStyleguide::MarkdownHandler.call(template, nil)
      end
    end
  end
end
