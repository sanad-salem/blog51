
class Room
  attr_accessor :reference, :name, :description, :connections

  def initialize(reference, name, desc, conn)
    @reference = reference
    @name = name
    @description = desc
    @connections = conn
  end

  def full_description
    @name + "\n\nYou are in " + @location
  end
end
