# frozen_string_literal: true

module ElementalStyleguide
  class MarkdownRenderer < Redcarpet::Render::HTML
    include Rouge::Plugins::Redcarpet

    def block_quote(quote)
      <<-BLOCKQUOTE
        <blockquote class="border-5 border-start border-secondary-subtle ps-3">
          #{quote}
        </blockquote>
      BLOCKQUOTE
    end

    def block_code(code, language)
      case language
      when "example"
        options, code = parse_options(code)
        example(code, options)
      else
        super
      end
    end

    def example(code, options)
      <<-EXAMPLE
        <div class="card shadow-sm">
          <div class="card-body">
            <iframe src="/styleguide/example?example=#{Base64.urlsafe_encode64(code)}"
                    width="#{options['width'] || '100%'}"
                    height="#{options['height'] || 'auto'}"
                    class="d-block"></iframe>
          </div>
          <div class="card-footer">
            #{block_code(code.strip, 'erb')}
          </div>
        </div>
      EXAMPLE
    end

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
