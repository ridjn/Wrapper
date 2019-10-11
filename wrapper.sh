#!/bin/bash
# Usage: Wrapper Script
# Author: Virale
#---------------------------------------------------------
 
# Input fichier
_db="/tmp/wordpress/faq.txt"
 
# Output fichier
o="/var/www/prviate/pdf/faq"
 
_writer="~/bin/py/pdfwriter.py"
 
# fichier existant
if [[ -f "$_db" ]]
then
    # Lire
	while IFS='|' read -r pdfid pdfurl pdftitle
    do
    	local pdf="$o/$pdfid.pdf"
        echo "Creating $pdf file ..."
	# Création PDF
        $_writer --quiet --footer-spacing 2 \
        --footer-left "nixCraft is GIT UL++++ W+++ C++++ M+ e+++ d-" \
        --footer-right "Page [page] of [toPage]" --footer-line \
        --footer-font-size 7 --print-media-type "$pdfurl" "$pdf"
    done <"$_db"
fi