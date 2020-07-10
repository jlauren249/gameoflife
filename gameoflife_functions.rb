@grid_size = 30
@counter = 0

def grid_builder
    # build grid with defualts
    grid = Array.new(@grid_size) { Array.new(@grid_size) {" "} }
end

def randomize grid
    (@grid_size*10).times do
        rand_row = rand(@grid_size)
        rand_col = rand(@grid_size)
        grid[rand_row][rand_col] = "o"
    end
end

def blinker_grid grid
    # add in starting point
    grid [2][2] = "o"
    grid [2][3] = "o"
    grid [2][4] = "o"
    grid [2][7] = "o"
    grid [2][8] = "o"
    grid [2][9] = "o"
    grid [3][2] = "o"
    grid [4][2] = "o"
    grid [3][7] = "o"
    grid [4][9] = "o"
    grid [5][2] = "o"
    grid [5][3] = "o"
    grid [5][4] = "o"
    grid [5][7] = "o"
    grid [5][8] = "o"
    grid [5][9] = "o"
end

def top_row grid, row, col
    if row > 0
        if grid[row - 1][col] == "o"
        @counter += 1
        end
        if grid[row - 1][col - 1] == "o"
        @counter += 1
        end
        if grid[row - 1][col + 1] == "o"
        @counter += 1
        end
    end
end

def bottom_row grid, row, col
    if row < @grid_size - 1
        if grid[row + 1][col] == "o"
        @counter += 1
        end
        if grid[row + 1][col - 1] == "o"
        @counter += 1
        end
        if grid[row + 1][col + 1] == "o"
        @counter += 1
        end

    end
end

def static_row grid, row, col
    if grid[row][col - 1] == "o"
        @counter += 1
        end
    
        if grid[row][col + 1] == "o"
        @counter += 1
        end
end


def count_living grid, row, col
    # look at all spaces touching grid point
    # use@counter to count total number of alive neighbors
    @counter = 0
    top_row grid, row, col
    bottom_row grid, row, col
    static_row grid, row, col
    @counter
end