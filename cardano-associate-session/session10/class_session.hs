inputListTuple :: [(Char, Char)]
inputListTuple = [(x, y) | x <- "a", y <- "b"]

inputListTuple2 :: [(Char, Int)]
inputListTuple2 = [(x, y) | x <- "a", y <- [2]]

inputListTuple3 :: Char -> Char -> [(Char, Char)]
inputListTuple3 x y = [(x, y)]