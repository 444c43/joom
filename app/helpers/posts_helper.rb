module PostsHelper
  def snip_body(text)
    snipped_text = Nokogiri::HTML(text).xpath("//text()").to_s
    snipped_text.scan(/\w+/)[0..50].join(' ') + '...'
  end
  def markdown(text)
    RDiscount.new(text, :footnotes).to_html.html_safe
  end
end
