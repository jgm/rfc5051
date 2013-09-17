module Data.RFC5051 (compareUnicode)
where
import Data.RFC5051.UnicodeData (decompositionMap)
import qualified Data.Map as M
import Data.Char (ord, toTitle)

-- | Compare two strings using @i;unicode-casemap@,
-- the simple unicode collation algorithm described in RFC 5051.
compareUnicode :: String -> String -> Ordering
compareUnicode x y = case compare x' y' of
                          EQ  -> compare (x', x) (y', y)
                          v   -> v
  where x' = canonicalize x
        y' = canonicalize y

canonicalize :: String -> [[Int]]
canonicalize = map (decompose . ord . toTitle)

decompose :: Int -> [Int]
decompose c =
  case decompose' c of
         Nothing -> [c]
         Just xs -> concatMap decompose xs

decompose' :: Int -> Maybe [Int]
decompose' c = M.lookup c decompositionMap
