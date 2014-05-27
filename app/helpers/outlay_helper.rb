module OutlayHelper
  def number_to_yen(number)
    number_to_currency(number, precision: 0, unit: '円', format: '%n%u')
  end
end
