class DriveIn

  attr_reader :name, :parked

  def initialize(name)
    @name = name
    @parked = []
  end

  def add_vehicle(car)
    @parked.append(car)
  end

  def multi_passanger
    @parked.select do |car|
      car.passengers.count > 1
    end
  end

  def minor_passengers
    minors = @parked.map do |car|
      car.passengers
    end.flatten
    minors.select do |minor|
      minor.adult? == false
    end
  end
end
