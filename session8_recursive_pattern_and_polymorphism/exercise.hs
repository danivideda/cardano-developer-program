skips :: [a] -> [[a]]
skips [] = [[]]
skips (x : xs) = (x : xs) : ag xs
 where
  ag (x : xs) = [xs]