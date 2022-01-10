-- TUGAS 1
keepOnlyOddValue :: (Int -> Bool) -> [Int] -> [Int]
keepOnlyOddValue _ [] = []
keepOnlyOddValue f (x : xs)
    | f x = x : keepOnlyOddValue f xs
    | otherwise = keepOnlyOddValue f xs

-- TUGAS 2
filterValue :: [Char] -> [Int] -> [Int]
filterValue _ [] = []
filterValue w (x : xs)
    | w == "even" = if even x then x : filterValue w xs else filterValue w xs
    | w == "odd" = if odd x then x : filterValue w xs else filterValue w xs
    | otherwise = 0 : filterValue w xs

-- TUGAS 3
accumulateRec :: (Int -> Int) -> [Int] -> [Int]
accumulateRec _ [] = []
accumulateRec f (x : xs) = f x : accumulateRec f xs

main :: IO ()
main = do
    print (keepOnlyOddValue odd [1 .. 10])
    print (filterValue "even" [1 .. 10])
    print (filterValue "odd" [1 .. 10])
    print (accumulateRec (+ 10) [1 .. 10])