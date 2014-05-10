module OutlayHelper
  def number_to_yen(number)
    number_to_currency(number, precision: 0, unit: '円', format: '%n%u')
  end

  def accordion_css_id(month)
    "accordion-outlay-#{month.strftime('%Y-%m')}"
  end
end
