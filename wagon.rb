require_relative 'modules/manufacturing_companies'

class Wagon
  include ManufacturingCompanies

  attr_reader :type

  def initialize(type)
    @type = type
  end
end