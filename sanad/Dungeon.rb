require 'Player'
require 'Room'

class Dungeon
  attr_accessor :player

  def initialize(player)
    @player = player
    @rooms = {}
  end

  #connections is a hash of connection name and direction
  def add_room(reference, name, description, connections)
    @rooms[reference] = Room.new(reference, name, description, connections)
  end

  def start(location)
    @player.location = location
    show_current_description
  end

  def show_current_description
    puts find_room_in_dungeon(@player.location).full_description
  end

  def find_room_in_dungeon(reference)
    @rooms[reference]
  end

  def find_room_in_direction(direction)
    find_room_in_dungeon(@player.location).connections[direction]
  end

  def go(direction)
    puts "You go " + direction.to_s
    @player.location = find_room_in_direction(direction)
    show_current_description
  end
end

player = Player.new('Sanad Bukiran')
my_dungeon = Dungeon.new(player)
#add rooms to the Dungeon
my_dungeon.add_room(:large_cave, 'Large Cave', 'A Large Cavernous cave',
  {:west => :small_cave})
my_dungeon.add_room(:small_cave, 'Small Cave', "A small claustrophobic cave",
  {east: :large_cave})
my_dungeon.start(:large_cave)
