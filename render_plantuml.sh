#!/bin/bash

# render_plantuml.sh - A script to render PlantUML diagrams to PNG files
# Usage: ./render_plantuml.sh [input_directory]

# Default values
INPUT_DIR="${1:-$(pwd)/diagrams}"
PLANTUML_JAR_URL="https://github.com/plantuml/plantuml/releases/download/v1.2025.2/plantuml-gplv2-1.2025.2.jar"
PLANTUML_JAR="plantuml.jar"

# Color codes for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Print banner
echo -e "${BLUE}==================================================${NC}"
echo -e "${BLUE}      PlantUML Rendering Script for Langflow      ${NC}"
echo -e "${BLUE}==================================================${NC}"

# Check if Java is installed
if ! command -v java &> /dev/null; then
    echo -e "${RED}Error: Java is required but not installed.${NC}"
    echo "Please install Java before running this script."
    exit 1
fi

# Check if PlantUML jar exists, download if not
if [ ! -f "$PLANTUML_JAR" ]; then
    echo -e "${YELLOW}PlantUML jar not found. Downloading...${NC}"
    
    # Check if curl is available, otherwise try wget
    if command -v curl &> /dev/null; then
        curl -L "$PLANTUML_JAR_URL" -o "$PLANTUML_JAR"
    elif command -v wget &> /dev/null; then
        wget "$PLANTUML_JAR_URL" -O "$PLANTUML_JAR"
    else
        echo -e "${RED}Error: Neither curl nor wget is installed.${NC}"
        echo "Please install either curl or wget, or manually download PlantUML jar."
        exit 1
    fi
    
    if [ ! -f "$PLANTUML_JAR" ]; then
        echo -e "${RED}Error: Failed to download PlantUML jar.${NC}"
        exit 1
    fi
    echo -e "${GREEN}PlantUML jar downloaded successfully.${NC}"
fi

# Check if input directory exists
if [ ! -d "$INPUT_DIR" ]; then
    echo -e "${RED}Error: Input directory '$INPUT_DIR' does not exist.${NC}"
    exit 1
fi

# Function to create the output directory structure
create_output_dir() {
    local file_path="$1"
    local rel_path=$(dirname "${file_path#$INPUT_DIR/}")
    local output_path="images/$rel_path"
    
    if [ ! -d "$output_path" ]; then
        mkdir -p "$output_path"
    fi
    
    echo "$output_path"
}

# Find all .puml files in the input directory
echo -e "${BLUE}Searching for PlantUML files in: ${NC}$INPUT_DIR"
PUML_FILES=$(find "$INPUT_DIR" -name "*.puml")
TOTAL_FILES=$(echo "$PUML_FILES" | wc -l | tr -d ' ')

if [ -z "$PUML_FILES" ]; then
    echo -e "${YELLOW}No .puml files found in directory.${NC}"
    exit 0
fi

echo -e "${GREEN}Found $TOTAL_FILES PlantUML files to render.${NC}"

# Render each file
COUNT=0
ERRORS=0
for file in $PUML_FILES; do
    COUNT=$((COUNT+1))
    filename=$(basename "$file" .puml)
    rel_path=${file#$INPUT_DIR/}
    output_dir=$(create_output_dir "$file")
    output_file="$output_dir/$filename.png"
    
    echo -e "${BLUE}[$COUNT/$TOTAL_FILES] Rendering: ${NC}$rel_path"
    
    # Run PlantUML with increased memory allocation
    java -Xmx2048m -XX:ReservedCodeCacheSize=1024m -jar "$PLANTUML_JAR" -tpng "$file" -o "$(realpath "$output_dir")"
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}  ✓ PNG rendered${NC}"
    else
        echo -e "${RED}  ✗ Error rendering: ${NC}$file"
        ERRORS=$((ERRORS+1))
    fi
done

# Summary
echo -e "${BLUE}==================================================${NC}"
echo -e "${GREEN}Rendering complete. ${NC}"
echo -e "${GREEN}Total files processed: ${NC}$TOTAL_FILES"
echo -e "${GREEN}Successfully rendered: ${NC}$((TOTAL_FILES-ERRORS))"

if [ $ERRORS -gt 0 ]; then
    echo -e "${RED}Failed to render: ${NC}$ERRORS"
    exit 1
else
    echo -e "${GREEN}All files rendered successfully! ${NC}"
fi

echo -e "${BLUE}==================================================${NC}"
echo -e "${YELLOW}To view the rendered diagrams, check the 'images' directory.${NC}"

exit 0