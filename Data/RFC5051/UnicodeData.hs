{-# LANGUAGE TemplateHaskell #-}
module Data.RFC5051.UnicodeData (unicodeData)
where
import Data.FileEmbed
import qualified Data.ByteString as B

unicodeData :: B.ByteString
unicodeData = $(embedFile "UnicodeData.txt")
