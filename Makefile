src/Data/RFC5051/UnicodeData.hs: UnicodeData.txt
	runghc MkUnicodeData.hs > $@

UnicodeData.txt:
	wget ftp://ftp.unicode.org/Public/UNIDATA/UnicodeData.txt -O UnicodeData.txt
