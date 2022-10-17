class Board

    def initialize(size)
        @size = size
        @grid = Array.new(size){Array.new(size)}
    end

    def size
        @size
    end

    def [](pos)
        row, column = pos
        @grid[row][column]
    end

    def []=(pos, mark)
        row, column = pos
        @grid[row][column] = mark
    end

    def complete_row?(mark)
        (0...@grid.length).each do |i|
            return true if @grid[i].all? {|ele| ele == mark} 
        end
        false
    end

    def complete_col?(mark)
        (0...@grid.length).each do |i|
            return true if @grid.all? {|grid| grid[i] == mark}
        end
        false
    end

    def complete_diag?(mark)
        rightleft(mark) || leftright(mark)
    end

    def rightleft(mark)
        (0...@grid.length).each do |i|
            if @grid[i][i] != mark
                return false
            end
        end
        true
    end

    def leftright(mark)
        col = @grid.length - 1
        (0...@grid.length).each do |i|
            if @grid[i][col - i] != mark
                return false
            end
        end
        true
    end

    def winner?(mark)
        complete_row?(mark) || complete_col?(mark) || complete_diag?(mark)
    end



    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @grid.each { |row| p row }
    end
end
