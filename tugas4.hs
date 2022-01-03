validateNumber :: [Int] -> Bool
validateNumber x = validate $ addLastDigit x $ sumAll $ substractByNine $ multiplyOddPositionNumber $ reverseDigit $ dropLastDigit x
  where
    dropLastDigit = init
    reverseDigit = reverse
    multiplyOddPositionNumber :: [Int] -> [Int]
    -- When there are more than 3 elements, i.e 1 : 2 : 3 : 4 : 5 : []
    multiplyOddPositionNumber (x : y : zs) = x * 2 : y : multiplyOddPositionNumber zs
    -- When there are only 2 elements left, i.e -> 5 : []
    multiplyOddPositionNumber (x : y) = x * 2 : multiplyOddPositionNumber y
    -- When the previous pattern only remains []
    multiplyOddPositionNumber [] = []
    substractByNine :: [Int] -> [Int]
    substractByNine (x : xs)
        | x > 9 = (x - 9) : substractByNine xs
        | otherwise = x : substractByNine xs
    substractByNine [] = []
    sumAll = sum
    addLastDigit :: [Int] -> Int -> Int
    addLastDigit x y = (+) (last x) y
    validate :: Int -> Bool
    validate x = mod x 10 == 0
