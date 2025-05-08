#!/bin/bash

SCRIPT=$(readlink -f "$0")
BASEDIR=$(dirname "$SCRIPT")
echo $BASEDIR
IMAGEDIR=$BASEDIR/images

echo $IMAGEDIR

if [ ! -d "$IMAGEDIR" ]; then
    mkdir -p $IMAGEDIR
fi

if [ $# -eq 1 ]; then
    echo "> render one plantuml file: $1"
    java -jar $BASEDIR/plantuml.jar $1
    echo " : $1" | sed 's/.puml/.png/g'
elif [ $# -eq 0 ]; then
    echo "> render all plantuml files under: $PWD"
    find . -name '*.puml' | while read file; do
        java -jar $BASEDIR/plantuml.jar $file
        echo " -> $file" | sed "s/.puml/.png/g"
    done
else
    echo " "
    echo "[Usage]"
    echo "1. render all of .plantuml files, recursively, under 'currently user located' directory."
    echo " - move under the directory you want to work on."
    echo " - call render_script.sh."
    echo "  (ex. docs/render_script.sh)"
    echo "2. render a specific .plantuml."
    echo " - call render_script.sh with one argument; a file name."
    echo "  (ex. render_script.sh {PLANTUML_FILE})"
    echo " * can see the output .png files right next to the original plantuml files"
    echo " "
fi

# Move PNG files to images directory if desired
# cp *.png $IMAGEDIR 2>/dev/null || true
