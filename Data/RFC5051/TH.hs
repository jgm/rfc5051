{-# LANGUAGE CPP, TemplateHaskell #-}
module Data.RFC5051.TH (embedFile)
where
import qualified Data.ByteString as B
import qualified Data.ByteString.Char8 as B8
import Language.Haskell.TH.Syntax

-- two functions copied from file-embed
embedFile :: FilePath -> Q Exp
embedFile fp =
#if MIN_VERSION_template_haskell(2,7,0)
    qAddDependentFile fp >>
#endif
  (runIO $ B.readFile fp) >>= bsToExp

bsToExp :: B.ByteString -> Q Exp
bsToExp bs = do
    helper <- [| B8.pack |]
    let chars = B8.unpack bs
    return $! AppE helper $! LitE $! StringL chars

