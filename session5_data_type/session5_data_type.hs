data IntList
    = Empty
    | Cons Int IntList
    deriving (Show)

intListProduct :: IntList -> Int
intListProduct Empty = 1
intListProduct (Cons head list) = head * intListProduct list

-- Cons 5 (Cons 2 (Cons 3 Empty))

intListProductx :: [Int] -> Int
intListProductx [] = 0
intListProductx (x : xs) = x * product xs

data Tree
    = Leaf Int
    | Node Tree Int Tree
    deriving (Show)

dummyTree :: Tree
dummyTree = Node (Leaf 2) 1 (Node (Leaf 4) 3 (Leaf 5))

findInTree :: Int -> Tree -> Bool
findInTree i (Leaf j) = i == j
findInTree i (Node left j right) = i == j || findInTree i left || findInTree i right