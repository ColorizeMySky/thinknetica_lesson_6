require_relative 'modules/manufacturing_companies'

class Wagon
  include ManufacturingCompanies

  attr_reader :type

  def initialize(type)
    @type = type

    validate!
  end

  def valid?
    validate!
    true
  rescue
    false
  end

  private

  def validate!
    raise "Тип вагона не может отсутствовать" if type.to_s.strip.empty?
    raise "Неизвестный тип вагона. Допустимые значения: 'cargo', 'passenger'" unless ['cargo', 'passenger'].include?(type)
  end
end