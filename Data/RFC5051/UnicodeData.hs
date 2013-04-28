{-# LANGUAGE CPP, TemplateHaskell #-}
module Data.RFC5051.UnicodeData (unicodeData)
where
import Data.RFC5051.TH (embedFile)
import qualified Data.ByteString as B

unicodeData :: B.ByteString
unicodeData = $(embedFile "UnicodeData.txt")
