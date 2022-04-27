gt100 :: Integer -> Bool
gt100 x = x > 100

greaterThan100 :: [Integer] -> [Integer]
greaterThan100 = filter gt100

greaterThan100_2 :: [Integer] -> [Integer]
greaterThan100_2 = filter (\x -> x > 100)