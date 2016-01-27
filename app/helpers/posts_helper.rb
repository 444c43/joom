module PostsHelper
  def markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, redcarpet_options)
    text = markdown.render(text)
    syntax_highlighter(text).html_safe
  end

  def snip_body(text)
    snipped_text = Nokogiri::HTML(markdown(text)).xpath("//text()").to_s
    snipped_text.scan(/\w+/)[0..50].join(' ') + '...'
  end

  private

  def redcarpet_options
    {
      autolink:                     true,
      fenced_code_blocks:           true,
      disable_indented_code_blocks: true,
      footnotes:                    true,
      space_after_headers:          true,
      strikethrough:                true,
      superscript:                  true,
    }
  end

  def syntax_highlighter(html)
    doc = Nokogiri::HTML.fragment(html)
    doc.search("pre").each do |pre|
      if (code = pre.child).name == 'code'
        pre.replace Pygmentize.process(code.text.rstrip, code[:class])
      end
    end
    doc.to_html
  end
end
