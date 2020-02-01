# frozen_string_literal: true

module ElementalStyleguide
  class MarkdownHandler
    class << self
      def call(template, _source)
        @markdown_renderer ||= Redcarpet::Markdown.new(
          ElementalStyleguide::MarkdownRenderer,
          autolink: true,
          tables: true,
          fenced_code_blocks: true
        )
        "#{@markdown_renderer.render(template.source).inspect}.html_safe"
      end
    end
  end
end
