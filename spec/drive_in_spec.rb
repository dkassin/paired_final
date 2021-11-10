require './lib/vehicle'
require './lib/passenger'
require './lib/drive_in'

describe DriveIn do
  it '#exists' do
    drive_in = DriveIn.new("Dani's Drives")
    expect(drive_in).to be_a DriveIn
  end

  it 'has attributes' do
    drive_in = DriveIn.new("Dani's Drives")

    expect(drive_in.name).to eq ("Dani's Drives")
    expect(drive_in.parked).to eq ([])
  end

  it 'can add vehicles that are parked there' do
    drive_in = DriveIn.new("Dani's Drives")
    vehicle = Vehicle.new("2001", "Honda", "Civic")
    vehicle_2 = Vehicle.new("2007", "Toyota", "Corolla")
    drive_in.add_vehicle(vehicle)
    drive_in.add_vehicle(vehicle_2)

    expect(drive_in.parked).to eq ([vehicle, vehicle_2])
  end


  it 'can list vehicles with multiple passengers' do
    drive_in = DriveIn.new("Dani's Drives")
    vehicle = Vehicle.new("2001", "Honda", "Civic")
    vehicle_2 = Vehicle.new("2007", "Toyota", "Corolla")
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    jude = Passenger.new({"name" => "Jude", "age" => 20})
    taylor = Passenger.new({"name" => "Taylor", "age" => 12})

    expect(drive_in.multi_passanger).to eq ([])
    vehicle.add_passenger(charlie)
    vehicle.add_passenger(taylor)
    vehicle_2.add_passenger(jude)
    drive_in.add_vehicle(vehicle)
    drive_in.add_vehicle(vehicle_2)

    expect(drive_in.multi_passanger).to eq ([vehicle])
  end

  it 'can list all passengers who are under 18' do
    drive_in = DriveIn.new("Dani's Drives")
    vehicle = Vehicle.new("2001", "Honda", "Civic")
    vehicle_2 = Vehicle.new("2007", "Toyota", "Corolla")
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    jude = Passenger.new({"name" => "Jude", "age" => 20})
    taylor = Passenger.new({"name" => "Taylor", "age" => 12})

    vehicle.add_passenger(charlie)
    vehicle.add_passenger(taylor)
    vehicle_2.add_passenger(jude)
    drive_in.add_vehicle(vehicle)
    drive_in.add_vehicle(vehicle_2)

    expect(drive_in.minor_passengers).to eq ([taylor])
  end
end
