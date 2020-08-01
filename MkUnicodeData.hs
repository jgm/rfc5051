module Main
where
import Data.Char (isHexDigit)

main = readFile "UnicodeData.txt" >>= rawDataToModule

rawDataToModule :: String -> IO ()
rawDataToModule bs = do
  let lns = map (splitOn ';') $ lines bs
  let pairs = takeWhile (\(x,_) -> x <= 0x2000)
              [ (toInt x, map toInt $ filter (all isHexDigit) $ words y) |
                    (x:_:_:_:_:y:_) <- lns, not (null y) ]
  putStrLn "module Data.RFC5051.UnicodeData (decompositionMap) where"
  putStrLn "import qualified Data.Map as M"
  putStrLn ""
  putStrLn "decompositionMap :: M.Map Int [Int]"
  putStrLn $ "decompositionMap = M.fromList " ++ show pairs

toInt :: String -> Int
toInt xs = read $ '0':'x':xs

splitOn :: Char -> String -> [String]
splitOn c s =
  case break (== c) s of
    (xs,_:ys) -> xs : splitOn c ys
    (xs,[])   -> [xs]
