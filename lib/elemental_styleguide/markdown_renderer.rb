# frozen_string_literal: true

module ElementalStyleguide
  class MarkdownRenderer < Redcarpet::Render::HTML
    def block_quote(quote)
      <<-BLOCK_QUOTE
        <blockquote class="border-5 border-start border-secondary-subtle ps-3">
          #{quote}
        </blockquote>
      BLOCK_QUOTE
    end

    def block_code(code, language)
      case language
      when "example"
        example(code)
      else
        <<-BLOCK_CODE
          <pre><code class="language-#{language} bg-body-tertiary">#{code}</code></pre>
        BLOCK_CODE
      end
    end

    # rubocop:disable Metrics/MethodLength
    def example(code)
      options, code = parse_options(code)

      <<-EXAMPLE
        <div class="card shadow-sm">
          <div class="card-body">
            <iframe src="/styleguide/example?example=#{Base64.urlsafe_encode64(code)}"
                    width="#{options['width'] || '100%'}"
                    height="#{options['height'] || 'auto'}"
                    class="d-block"></iframe>
          </div>
          <div class="card-footer">
            <pre class="mb-0"><code class="language-erb bg-transparent p-0">#{code}</code></pre>
          </div>
        </div>
      EXAMPLE
    end
    # rubocop:enable Metrics/MethodLength

    private

    def parse_options(code)
      pieces = code.split("---")

      if pieces.length > 1
        options = pieces[0].split("\n").to_h { |i| i.split(": ") }
        [options, pieces[1]]
      else
        options = {}
        [options, pieces[0]]
      end
    end
  end
end
