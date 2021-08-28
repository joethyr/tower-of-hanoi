class TowerHanoi
  def initialize
    @columns = { 1 => ["o"], 2 => ["oo"], 3 => %w[ooo oooo] }
  end

  def display_tower
    3.times do |i|
      puts @columns.fetch_values(i + 1)
      puts "Column #{i + 1}"
      puts
    end
  end

  def remove_disk
    puts "Enter the column number of the disk you want to move:"
    print ">"
    disk_from = gets.chomp.to_i
    if [1, 2, 3].any? { |num| num == disk_from}
      @value_from = @columns[disk_from].shift
      puts "The disk has now been removed from Column #{disk_from}."
    else
      puts "The entered Column number is not valid."
      remove_disk
    end
  end

  def move_disk
    puts "Please enter which row you will put the disk in?"
    print ">"
    disk_to = gets.chomp.to_i
    if [1, 2, 3].any? { |num| num == disk_to}
      @columns.fetch(disk_to).unshift(@value_from)
    else
      puts "The entered Column number is not valid."
      move_disk
    end
    puts
  end

  def game
    until @columns.value?(%w[o oo ooo oooo])
      display_tower
      remove_disk
      move_disk
    end
    display_tower
    puts "You Win!!!"
  end
end

play = TowerHanoi.new
play.game
