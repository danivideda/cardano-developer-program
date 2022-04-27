-- TASK 1
fun1 :: [Int] -> Int
fun1 x = product (map (\x -> x - 2) (filter even x))

-- TASK 2
fun2 :: Int -> Int
fun2 x = if x == 1 then 0 else if even x then x + fun2 (x `div` 2) else fun2 (3 * x + 1)