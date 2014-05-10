class OutlayDecorator < Draper::Decorator
  delegate_all

  def display_amount
    if note.present?
      h.content_tag(:span, title: note, class: 'has-tip', 'data-tooltip' => '') {
        h.number_to_yen(outlay.amount)
      }
    else
      h.number_to_yen(outlay.amount)
    end
  end
end
