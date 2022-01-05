checkDigit :: [Int] -> Int
checkDigit [x] = x
checkDigit (_:xs) = checkDigit xs
checkDigit [] = 0

reverseNumber :: [Int] -> [Int] 
reverseNumber (x:xs) = xs ++ [x]
reverseNumber [] = []

multOdd :: [Int] -> [Int]
multOdd (x:y:zs) = x*2 : y : multOdd zs
multOdd (x:ys) = x*2 : ys
multOdd [] = []