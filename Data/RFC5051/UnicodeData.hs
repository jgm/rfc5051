{-# LANGUAGE CPP, TemplateHaskell #-}
module Data.RFC5051.UnicodeData (unicodeData)
where
import Data.RFC5051.TH (embedFile)
import Data.RFC5051.Types (S)
import qualified Data.ByteString as B

unicodeData :: [[S]]
unicodeData = $(embedFile "UnicodeData.txt")
