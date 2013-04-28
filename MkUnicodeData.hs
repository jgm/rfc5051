module Main
where
import Data.Char (isDigit)
import Data.RFC5051.Types
import qualified Data.ByteString.Char8 as B8

main = B8.readFile "UnicodeData.txt" >>= rawDataToModule

rawDataToModule :: B8.ByteString -> IO ()
rawDataToModule bs = do
  let lns = map (B8.split ';') $ take 0x2000 $ B8.lines bs
  let pairs = [ (toInt x, map toInt $ filter (B8.all isDigit) $ B8.words y) |
                    (x:_:_:_:_:y:_) <- lns, not (B8.null y) ]
  putStrLn "module Data.RFC5051.UnicodeData (decompositionMap) where"
  putStrLn "import Data.RFC5051.Types"
  putStrLn ""
  putStrLn "decompositionMap :: [(Int, [Int])]"
  putStrLn $ "decompositionMap = " ++ show pairs

toInt :: B8.ByteString -> Int
toInt xs = read $ '0':'x': B8.unpack xs
