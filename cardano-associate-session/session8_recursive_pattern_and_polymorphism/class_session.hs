skips :: [a] -> [[a]]
skips [] = []
skips (x : y : zs) = [[x, y]]
skips (x : xs) = [x : xs]

localMaxima :: [Int] -> [Int]
localMaxima x = [1, 2, 3]