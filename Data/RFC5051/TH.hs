{-# LANGUAGE CPP, TemplateHaskell, QuasiQuotes #-}
module Data.RFC5051.TH (embedFile)
where
import qualified Data.ByteString as B
import qualified Data.ByteString.Char8 as B8
import Language.Haskell.TH.Syntax
import Data.RFC5051.Types

-- two functions copied from file-embed
embedFile :: FilePath -> Q Exp
embedFile fp =
#if MIN_VERSION_template_haskell(2,7,0)
    qAddDependentFile fp >>
#endif
  (runIO $ B.readFile fp) >>= bsToExp

bsToExp :: B.ByteString -> Q Exp
bsToExp bs =
  let lns = map (map B8.unpack . B8.split ';') $ take 0x2000 $ B8.lines bs
  in  [| [ (toInt x, toInt y) | (x:_:_:_:_:_:_:_:_:_:_:_:_:_:y:[]) <- lns,
               not (null y), x /= y ] |]

toInt :: String -> Int
toInt xs = read $ '0':'x':xs
