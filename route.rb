require_relative 'modules/instance_counter'

class Route
  include InstanceCounter

  attr_reader :stations

  def initialize(first, last)
    @stations = [first, last]

    validate!

    register_instance
  end

  def add_station(station, position = -2)
    @stations.insert(position, station)
  end

  def remove_station(station)
    @stations.delete(station)
  end

  def valid?
    validate!
    true
  rescue
    false
  end

  private

  def validate!
    raise "Начальная станция не может отсутствовать" if @stations.first.nil?
    raise "Конечная станция не может отсутствовать" if @stations.last.nil?
    raise "Начальная и конечная станции не могут совпадать" if @stations.first == @stations.last
  end
end