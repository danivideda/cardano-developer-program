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

data Tree
  = Node Int Tree Tree
  | Leaf Int
  deriving (Show)

branch1 = Node 5 (Leaf 2) (Leaf 1)
branch2 = Node 5 branch1 (Leaf 10)

func :: [Int] -> [Int]
func [] = []
func (x : xs) = x : xs

data Building
  = Skyscraper
      { name :: String
      , height :: Int
      }
  | House
      { name :: String
      , familyCount :: Int
      }
  deriving (Show)

sum3 :: Integer -> Integer -> Integer -> Integer
sum3 x y z = x + y + z

data Person = Person String Int Int deriving (Show)

myfunc p@(Person n _ _) = "The name of the field of (" ++ show p ++ ") is " ++ n

data FailableDouble = FailableDouble | OK Double deriving (Show)

a :: FailableDouble
a = OK 2.0

b :: FailableDouble
b = FailableDouble