-- Task 1
myNestedCond :: Int -> Int -> Int -> String
myNestedCond a b c = if a <= b
                     then "Lebih kecil dari " ++ show b
                     else
                         if a <= c
                         then "Lebih kecil dari " ++ show c
                         else "Lebih besar dari " ++ show c


bagidua :: Float -> Float
bagidua x = x / 2