rfc5051 - Simple unicode collation
----------------------------------

This library implements the simple, non locale-sensitive unicode collation
algorithm described in [RFC 5051](http://www.rfc-editor.org/rfc/rfc5051.txt).
Proper unicode collation can be done using
[text-icu](http://hackage.org/package/text-icu), but that is a big
dependency that depends on a large C library.  rfc5051 might be better
for some purposes.

Here is a list of lines sorted by the Prelude's `sort` function:

Abe
Oeb
abe
abé
oeb
Ábe
Äbe
Ôeb
ábe
äbe
ôeb

Here is the same list sorted by `sortBy compareUnicode`:

Abe
abe
abé
Ábe
ábe
Äbe
äbe
Oeb
oeb
Ôeb
ôeb

The library's data module, `Data.RFC5051.UnicodeData`, is generated
from the data file `UnicodeData.txt`.  To regenerate it, use the
Makefile or:

    runghc -isrc MkUnicodeData.hs -package bytestring \
      -package containers  > src/Data/RFC5051/UnicodeData.hs

