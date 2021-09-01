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

  def render
    3.times do |i|
      puts @columns[i]
      puts "Column #{i + 1}"
      puts
    end
  end

  def game
    until @columns.include? @winning_array
      render
      remove_disk
      move_disk
    end
    render
    puts "Congratulations! You win!"
  end

  def remove_disk
    puts "Enter the column number of the disk you want to move:"
    print ">"
    disk_from = gets.chomp
    if [1, 2, 3].any? { |num| num == disk_from.to_i}
      @value_from = @columns[disk_from.to_i - 1].shift
      puts "The disk has now been removed from Column #{disk_from}."
    elsif disk_from == "quit"
      puts "Goodbye!"
      exit
    else
      puts "The entered Column number is not valid."
      return remove_disk
    end
  end

  def move_disk
    puts "Please enter which row you will put the disk in?"
    print ">"
    disk_to = gets.chomp.to_i
    if [1, 2, 3].any? { |num| num == disk_to.to_i }
      @columns.fetch(disk_to.to_i - 1).unshift(@value_from)
    elsif disk_to == "quit"
      puts "Goodbye!"
      exit
    else
      puts "The entered Column number is not valid."
      return move_disk
    end
    puts
  end
end

play = TowerHanoi.new(4)
play.game
