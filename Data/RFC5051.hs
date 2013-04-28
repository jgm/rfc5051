module Data.RFC5051 (compareUnicode)
where
import Data.RFC5051.UnicodeData (decompositionMap)
import qualified Data.Map as M
import Data.Char (ord, toTitle)

compareUnicode :: String -> String -> Ordering
compareUnicode x y = case compare (canonicalize x) (canonicalize y) of
                          EQ  -> compare x y
                          v   -> v

canonicalize :: String -> [[Int]]
canonicalize = map (decompose . ord . toTitle)

decompose :: Int -> [Int]
decompose c =
  case decompose' c of
         Nothing -> [c]
         Just xs -> concatMap decompose xs

decompose' :: Int -> Maybe [Int]
decompose' c = M.lookup c decompositionMap
