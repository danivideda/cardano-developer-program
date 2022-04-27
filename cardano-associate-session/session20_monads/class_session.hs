-- data PosisiBola = PosisiBola {posisiXY :: (Float, Float)} deriving (Show)

-- cetakPosisi1 :: Float -> Float -> PosisiBola
-- cetakPosisi1 x y = PosisiBola{posisiXY = (x, y)}

-- cetakPosisi2 :: Float -> Float -> IO ()
-- cetakPosisi2 x y = do
--     let newValue = PosisiBola{posisiXY = (x, y)}
--     let setelahDiUbah = ubahPosisi newValue
--     print setelahDiUbah

-- ubahPosisi :: PosisiBola -> PosisiBola
-- ubahPosisi PosisiBola{posisiXY = (x, y)} =
--     let newX = x + 1
--         newY = y + 1
--      in PosisiBola{posisiXY = (newX, newY)}

-- cetakPosisi3 :: Float -> Float -> IO ()
-- cetakPosisi3 x y = do
--     let x' = x + 1
--     let y' = y + 1
--     let newValue = PosisiBola{posisiXY = (x', y')}
--     print newValue

-- cetakPosisi4 :: Float -> Float -> IO ()
-- cetakPosisi4 x y = do
--     let x' = x + 1
--     let y' = y + 1
--     let newValue = PosisiBola{posisiXY = (x', y')}
--     print newValue
--     cetakPosisi4 x' y'

-- cetakPosisi5 :: Float -> Float -> IO ()
-- cetakPosisi5 x y = do
--     if x < 15.0
--         then do
--             let x' = x + 1
--             let y' = y + 1
--             let newValue = PosisiBola{posisiXY = (x', y')}
--             print newValue
--             cetakPosisi5 x' y'
--         else return ()

-- ------___________-__________--------------

newtype Reader r a = Reader {runReader :: r -> a}

reader1 :: Num r => Reader r r
reader1 = Reader $ \r -> r + 1

-- reader2 :: Show r => Reader r String
-- reader2 = Reader $ \r -> "Hasil reader adalah" ++ show r

reader2 :: (Show r, Num r) => Reader r String
reader2 = Reader $ \r -> "Hasil reader adalah" ++ show (r + 1)

newtype PosisiBola awal akhir = PosisiBola {ubahPosisiXY :: awal -> akhir}

mefunc = do
    a <- getLine
    putStrLn a