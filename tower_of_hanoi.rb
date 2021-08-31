class TowerHanoi
  def initialize(number_disks)
    @number_disks = number_disks
    @columns = [[], [], []]
    @winning_array = []
    generate_disks
  end

  def generate_disks
    count_disk = ''
    @number_disks.times do
      count_disk += "o"
      @winning_array <<  count_disk
      @columns[rand(3)].unshift(count_disk)
    end
  end

  def display_tower
    3.times do |i|
      puts @columns[i]
      puts "Column #{i + 1}"
      puts
    end
  end

  def remove_disk
    puts "Enter the column number of the disk you want to move:"
    print ">"
    disk_from = gets.chomp.to_i
    if [1, 2, 3].any? { |num| num == disk_from}
      @value_from = @columns[disk_from - 1].shift
      puts "The disk has now been removed from Column #{disk_from}."
    else
      puts "The entered Column number is not valid."
      return remove_disk
    end
  end

  def move_disk
    puts "Please enter which row you will put the disk in?"
    print ">"
    disk_to = gets.chomp.to_i
    if [1, 2, 3].any? { |num| num == disk_to}
      @columns.fetch(disk_to - 1).unshift(@value_from)
    else
      puts "The entered Column number is not valid."
      return move_disk
    end
    puts
  end

  def game
    until @columns.include? @winning_array
      display_tower
      remove_disk
      move_disk
    end
    puts "you win!"
  end
end

play = TowerHanoi.new(3)
play.game
