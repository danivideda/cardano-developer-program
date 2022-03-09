module Main where

import Data.Char ()
import Data.Time (TimeOfDay)

data Jadwal = Jadwal
    { nama :: String
    , jadwal :: TimeOfDay
    }

main :: IO ()
main = putStrLn "Hello, Haskell!"
