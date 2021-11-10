class Passenger

  attr_reader :name,
              :age,
              :drives

  def initialize(attributes)
    @name = attributes["name"]
    @age = attributes["age"]
    @drives = false
  end

  def adult?
    @age >= 18
  end

  def driver?
    @drives
  end

  def drive
    @drives = true
  end
end
