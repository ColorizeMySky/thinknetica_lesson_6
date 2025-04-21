require_relative 'modules/instance_counter'

class Station
  include InstanceCounter

  attr_reader :title, :trains

  @@stations = []

  class << self
    def all
      @@stations
    end
  end

  def initialize(title)
    @title = title
    @trains = []

    @@stations << self
    register_instance
  end

  def add_train(rain)
    @trains << train
  end

  def depart_train(train)
    @trains.delete(train)
  end

  def trains_by_type(type)
    @trains.count { |train| train.type == type }
  end
end