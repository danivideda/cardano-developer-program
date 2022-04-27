data Tree a
    = Empty
    | Node (Tree a) a (Tree a)
    deriving (Show, Eq)

leaf :: a -> Tree a
leaf x = Node Empty x Empty

instance Functor Tree where
    fmap f Empty = Empty
    fmap f (Node l x r) = Node (fmap f l) (f x) (fmap f r)

-- Function to compute the size of a tree
-- (i.e the number of nodes)
treeSize :: Tree a -> Int
treeSize Empty = 0
treeSize (Node l _ r) = 1 + treeSize l + treeSize r

-- Function to compute the sum of Int s data
treeSum :: Tree Int -> Int
treeSum Empty = 0
treeSum (Node l x r) = x + treeSum l + treeSum r

-- Function to calculate the depth of Tree
treeDepth :: Tree a -> Int
treeDepth Empty = 0
treeDepth (Node l _ r) = 1 + max (treeDepth l) (treeDepth r)

-- Function to flatten the Tree
flatten :: Tree a -> [a]
flatten Empty = []
flatten (Node l x r) = flatten l ++ [x] ++ flatten r

--------------------------------
-- The generalization section --
--------------------------------

treeFold :: b -> (b -> a -> b -> b) -> Tree a -> b
treeFold e _ Empty = e
treeFold e f (Node l x r) = f (treeFold e f l) x (treeFold e f r)

-- Size
treeSize' :: Tree a -> Int
treeSize' = treeFold 0 (\l _ r -> 1 + l + r)

-- Sum of Int
treeSum' :: Tree Int -> Int
treeSum' = treeFold 0 (\l x r -> l + x + r)

-- Depth of Tree
treeDepth' :: Tree a -> Int
treeDepth' = treeFold 0 (\l _ r -> 1 + max l r)

-- Flatten
flatten' :: Tree a -> [a]
flatten' = treeFold [] (\l x r -> l ++ [x] ++ r)

node1 = Node (leaf 2) 20 (leaf 20)
node2 = Node (leaf 1) 10 (leaf 10)
node3 = Node node1 30 node2
