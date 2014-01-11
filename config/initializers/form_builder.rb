class FormBuilder < ActionView::Helpers::FormBuilder

  def label(method, text = nil, options = {}, &block)
    if object.errors.any?
      error_message = object.errors[method].first
      error_span = @template.content_tag(:span, error_message, class: 'error')
      text = (method.to_s.humanize <<  " #{error_span}").html_safe
    end
    super(method, text, options, &block)
  end

  def check_box_with_label(method, text = nil, *args)
    text ||= method.to_s
    box = [check_box(method, *args), text].join(" ")
    label(method, box.html_safe, *args)
  end

end

ActionView::Base.default_form_builder = ::FormBuilder
