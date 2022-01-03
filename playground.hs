fac :: Int -> Int
fac n = aux n 1
 where
  aux n acc
    | n <= 1 = acc
    | otherwise = aux (n - 1) (n * acc)

caseFunc n =
  case n of
    2 -> "True"
    29 -> "False"
    _ -> "Not"

-- QUICKSORT
qsort :: Ord a => [a] -> [a]
qsort [] = []
qsort (p : xs) = qsort lesser ++ [p] ++ qsort greater
 where
  lesser = filter (< p) xs
  greater = filter (>= p) xs

somefunc :: Int -> Int
somefunc = otherfunc True
 where
  otherfunc :: Bool -> Int -> Int
  otherfunc n x = if n then 1 else 0

data CekDoubleKah = BukanDouble | BenarDouble Double deriving (Show)

safeDiv :: Double -> Double -> CekDoubleKah
safeDiv _ 0 = BukanDouble
safeDiv x y = BenarDouble (x / y)

failureToZero :: CekDoubleKah -> Double
failureToZero BukanDouble = 0
failureToZero (BenarDouble d) = d
