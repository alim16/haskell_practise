data Colour = RED| GREEN | BLUE 

instance Show Colour where
    show RED = "red"
    show GREEN = "green"
    show BLUE = "blue"



myColours = [RED,GREEN,BLUE,BLUE]



data Tree a = Leaf | Node a (Tree a) (Tree a) deriving (Eq,Ord,Show,Read)

myTree  = Node 5 (Node 3 Leaf Leaf) (Node 4 Leaf (Node 5 Leaf Leaf))


sumTree :: Num a => Tree a -> a
sumTree Leaf = 0
sumTree (Node n t1 t2) = n + sumTree t1 + sumTree t2




---------------------------------------directions
type Pos = (Int,Int) deriving (Show)

data Move = North | South | East | West
            deriving (Show)

move :: Move -> Pos -> Pos
move North (x,y) = (x, y+1)
move South (x,y) = (x, y-1)
move West (x,y) = (x-1, y)
move East (x,y) = (x+1, y)

moves :: [Move] -> Pos -> Pos
moves []     p = p
moves (m:ms) p  = moves ms (move m p)

rev :: Move -> Move
rev North = South
rev South = North
rev East = West
rev West = East


--------------------------

