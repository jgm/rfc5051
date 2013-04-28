module Data.RFC5051.Types (Category(..))
where

data Category =
        Lm   -- Letter, Modifier
     |  Lo   -- Letter, Other
     |  Pc   -- Punctuation, Connector
     |  Pd   -- Punctuation, Dash
     |  Ps   -- Punctuation, Open
     |  Pe   -- Punctuation, Close
     |  Pi   -- Punctuation, Initial quote (may behave like Ps or Pe)
     |  Pf   -- Punctuation, Final quote (may behave like Ps or Pe)
     |  Po   -- Punctuation, Other
     |  Sm   -- Symbol, Math
     |  Sc   -- Symbol, Currency
     |  Sk   -- Symbol, Modifier
     |  So   -- Symbol, Other
     |  Lu   -- Letter, Uppercase
     |  Ll   -- Letter, Lowercase
     |  Lt   -- Letter, Titlecase
     |  Mn   -- Mark, Non-Spacing
     |  Mc   -- Mark, Spacing Combining
     |  Me   -- Mark, Enclosing
     |  Nd   -- Number, Decimal Digit
     |  Nl   -- Number, Letter
     |  No   -- Number, Other
     |  Zs   -- Separator, Space
     |  Zl   -- Separator, Line
     |  Zp   -- Separator, Paragraph
     |  Cc   -- Other, Control
     |  Cf   -- Other, Format
     |  Cs   -- Other, Surrogate
     |  Co   -- Other, Private Use
     |  Cn   -- Other, Not Assigned
     deriving (Show, Read, Eq)

