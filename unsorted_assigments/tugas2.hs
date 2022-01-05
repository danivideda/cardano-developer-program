-- TASK 1
-- Buat sebuah function yg akan menambahkan setiap inputan dari user ke dalam list, didepan list yg ada (listnya bebas), contoh listnya adalah [1,2,3] 
-- 2 argument , argumen 1 = list, argument ke 2 adalah bilangin di tambahkan ke list
-- task1 [1,2,3] 10 = [10,1,2,3]
task1 :: [Int] -> Int -> [Int]
task1 lst x = x : lst

-- TASK 2
-- Buat sebuah function yg akan menambahkan setiap inputan dari user ke dalam list, dibelakang list yg ada (listnya bebas), contoh listnya adalah [1,2,3]
-- task2 [1,2,3] 20 = [1,2,3,20]
task2 :: [Int] -> Int -> [Int]
task2 lst x = lst ++ [x]

-- TASK 3
-- Buat sebuah function yg akan mengambil 1 angka didepan sebuah list
-- task3 [1,2,3] = 1
task3 :: [Int] -> Int
task3 (x:xs) = x

-- TASK 4
-- Buat sebuah function yg menggunakan guards dan mengambil 5 elemen list yg diberikan dalam argument,
-- hanya jika panjang list lebih dari 10, jika kurang dari 10 maka biarkan saja

-- hasil yg diharapkan
-- ghci> cekAmbil10 [1,2,3,4,5,6,7,8,9,10]
-- [1,2,3,4,5,6,7,8,9,10]

-- ghci> cekAmbil10 [1,2,3,4,5,6,7,8,9,10,12]
-- [1,2,3,4,5]
cekAmbil10 :: [Int] -> [Int]
cekAmbil10 lst
  | length lst > 10 = take 5 lst
  | otherwise = lst

-- TASK 5
-- Buat function seperti tugas nomor 4 tapi dengan logic pattern matching dan ada basic type jika list nya kosong [] maka keluarkan kosong

-- ghci> cekAmbil10PM [1,2,3,4,5,6,7,8,9,10,12]
-- [1,2,3,4,5]

-- ghci> cekAmbil10PM [1,2,3,4,5,6,7,8,9,10]  
-- [1,2,3,4,5,6,7,8,9,10]

-- ghci> cekAmbil10PM []                   
-- []

cekAmbil10PM :: [Int] -> [Int]
cekAmbil10PM [] = []
cekAmbil10PM lst = if length lst > 10 then take 5 lst else lst