-- TASK 1
taskA :: [Int] -> [String]
taskA x = replicate (sum x) "X"

-- TASK 2
taskB :: [Int] -> [[String]]
taskB = fmap (\y -> replicate y "X")