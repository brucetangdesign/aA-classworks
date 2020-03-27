module Slideable
    HORIZONTAL_AND_VERTICAL_DIRS = [
        [-1,0],
        [0,-1],
        [0,1],
        [1,0]
    ].freeze

    DIAGONAL_DIRS = [
        [-1,-1],
        [-1,1],
        [1,-1],
        [1,1]
    ].freeze

    def horizontal_andvertical_dirs
        HORIZONTAL_AND_VERTICAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end
    
    def moves
        moves = []
        
        moves
    end

    def move_dirs
        # subclass implements this
        raise NotImplementedError
    end

    def grow_unblocked_mpves(dx,dy)

    end
end