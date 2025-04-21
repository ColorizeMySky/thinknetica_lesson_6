require_relative 'modules/instance_counter'

class Station
  include InstanceCounter

  attr_reader :title, :trains

  TITLE_FORMAT = /^[a-zа-я0-9\s\-]+$/i

  @@stations = []

  class << self
    def all
      @@stations
    end
  end

  def initialize(title)
    @title = title
    @trains = []

    validate!

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

  def valid?
    validate!
    true
  rescue
    false
  end

  private

  def validate!
    raise "Название не может отсутствовать" if title.to_s.strip.empty?
    raise "Название станции слишком короткое (минимум 2 символа)" if title.length < 2
    raise "Название станции слишком длинное (максимум 50 символов)" if title.length > 50
    raise "Название станции содержит недопустимые символы" unless title !~ TITLE_FORMAT
  end
end