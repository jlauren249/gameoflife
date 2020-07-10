require './gameoflife_functions'

grid = grid_builder

#randomize grid
blinker_grid grid

# display grid -> 2 loops, one print one puts
generations = 0
while generations < 1000
    generations += 1

    temp_grid = Array.new(@grid_size) { Array.new(@grid_size) {" "} }
    
    (0...@grid_size).each do |row|
        (0...@grid_size).each do |col|
            count_living grid, row, col
            if grid[row][col] == "o" && (@counter < 2 ||@counter > 3)
                temp_grid[row][col] = " "
            elsif grid[row][col] == " " && @counter == 3
                temp_grid[row][col] = "o"
            else
                temp_grid[row][col] = grid[row][col]
            end
        end
    end
    system('cls')
    (0...@grid_size).each do |row|
        (0...@grid_size).each do |col|
            print temp_grid[row][col]
            print " "
        end
        puts
    end    
    grid = temp_grid
    sleep 0.5
end