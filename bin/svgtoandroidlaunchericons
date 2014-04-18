#!/bin/bash -e
#
# Creates launcher icons for android of various dimensions from source svg image
#
#	LDPI - 36 x 36
#	MDPI - 48 x 48
#	HDPI - 72 x 72
#	XHDPI - 96 x 96
#	XXHDPI - 144 x 144
#	XXXHDPI - 192 x 192.
#	WEB - 512 x 512
#	
# Based off script by Christian Beier, shoutrLabs
#

function svgToPng {
	FILE=$1
	SIZE=$2
	DESTDIR=`basename $FILE .svg`"_icons/$3"
	
    if [ -e $FILE ]; then
		echo '### EXPORTING '$FILE $SIZE $DESTDIR' ...'

#        EXPORTFILE=`basename $FILE .svg`
#        EXPORTFILE=$EXPORTFILE".png"
        EXPORTFILE="launcher.png"

        # If format is WIDTHxHEIGHT do this, else assume 1:1 ratio
        if [ `echo $SIZE | grep -E '^[0-9]+x[0-9]+$'` ]; then
            SIZEWIDTH=`echo $SIZE | sed 's/x[0-9]*//'`
            SIZEHEIGHT=`echo $SIZE | sed 's/[0-9]*x//'`
        else
            SIZEWIDTH=$SIZE
            SIZEHEIGHT=$SIZE
        fi

        mkdir -p $DESTDIR
		rsvg-convert -f png -w ${SIZEWIDTH} -h ${SIZEHEIGHT} -o ${DESTDIR}/$EXPORTFILE $FILE
#        inkscape --without-gui --file=$FILE --export-area-drawing --export-png="$DESTDIR/$EXPORTFILE" -w=$SIZEWIDTH -h=$SIZEHEIGHT

    else 
        echo "File does not exist: $FILE"
    fi

}


svgToPng $1 36 "drawable-ldpi"
svgToPng $1 48 "drawable-mdpi"
svgToPng $1 72 "drawable-hdpi"
svgToPng $1 96 "drawable-xhdpi"
svgToPng $1 144 "drawable-xxhdpi"
svgToPng $1 192 "drawable-xxxhdpi"
svgToPng $1 512 "web"
