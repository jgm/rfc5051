src/Data/RFC5051/UnicodeData.hs: UnicodeData.txt
	runghc -isrc MkUnicodeData.hs -package bytestring -package containers  > $@

UnicodeData.txt:
	wget ftp://ftp.unicode.org/Public/UNIDATA/UnicodeData.txt -O UnicodeData.txt
