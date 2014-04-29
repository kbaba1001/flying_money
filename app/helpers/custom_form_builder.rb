class CustomFormBuilder < ActionView::Helpers::FormBuilder
  def error_messages_on(field_name)
    return unless error_messages = object.errors.full_messages_for(field_name).presence

    @template.content_tag(:div, error_messages.join(' '), class: 'error')
  end
end
