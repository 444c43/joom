module DummyImageHelper
  def dummy_image(width, height, background=nil, text=nil)
    background = background ? "/#{background}" : ""
    text = text ? "/#{text}" : ""
    content_tag :img, nil, alt: "", "data-src" => "/placeholder/#{width}x#{height}#{background}#{text}"
  end
end
