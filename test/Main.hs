import System.Exit
import qualified Data.Text as T
import Data.Text (Text)
import Data.RFC5051 (compareUnicode)
import Data.List (sortBy)

main :: IO ()
main = do
  passed <- mapM runTest tests
  if and passed
     then exitWith ExitSuccess
     else exitWith $ ExitFailure 1

runTest :: ([Text],[Text]) -> IO Bool
runTest (ls, expected) =
  let actual = sortBy compareUnicode ls
   in if actual == expected
         then return True
         else do
           putStrLn $ "FAILED:   " ++ show ls
           putStrLn $ "EXPECTED: " ++ show expected
           putStrLn $ "GOT:      " ++ show actual
           return False

tests :: [([Text],[Text])]
tests = map (\(xs,ys) -> (map T.pack xs, map T.pack ys))
  [(["Abe", "Oeb", "abe", "ab\233", "oeb", "\193be", "\196be",
     "\212eb", "\225be", "\228be", "\244eb"],
    ["Abe", "abe", "ab\233", "\193be", "\225be",
     "\196be", "\228be", "Oeb", "oeb", "\212eb", "\244eb"])
  ,(["Aboma", "De Quincey", "Noakes"],
    ["Aboma", "De Quincey", "Noakes"])
  ]
