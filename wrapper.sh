#!/bin/bash
_db="/tmp/wordpress/faq.txt"
 
o="/var/www/prviate/pdf/faq"
 
_writer="~/bin/py/pdfwriter.py"
 
if [[ -f "$_db" ]]
then

	while IFS='|' read -r pdfid pdfurl pdftitle
    do
    	local pdf="$o/$pdfid.pdf"
        echo "Creating $pdf file ..."

        $_writer --quiet --footer-spacing 2 \
        --footer-left "nixCraft is GIT UL++++ W+++ C++++ M+ e+++ d-" \
        --footer-right "Page [page] of [toPage]" --footer-line \
        --footer-font-size 7 --print-media-type "$pdfurl" "$pdf"
    done <"$_db"
fi