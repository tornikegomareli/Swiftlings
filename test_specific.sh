#!/bin/bash
# test_specific.sh - A simple test script for specific Swift files

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Default parameters
FILE_PATH=""
VERBOSE=false

# Parse command line arguments
while (( "$#" )); do
  case "$1" in
    --file|-f)
      FILE_PATH="$2"
      shift 2
      ;;
    --verbose|-v)
      VERBOSE=true
      shift
      ;;
    --help|-h)
      echo "Usage: ./test_specific.sh [OPTIONS]"
      echo ""
      echo "Options:"
      echo "  -f, --file FILE_PATH    Test a specific Swift file"
      echo "  -v, --verbose           Show more detailed output"
      echo "  -h, --help              Show this help message"
      exit 0
      ;;
    *)
      echo "Unknown option: $1"
      exit 1
      ;;
  esac
done

# Check if file path is provided
if [ -z "$FILE_PATH" ]; then
  echo -e "${RED}Error: File path is required. Use --file option.${NC}"
  exit 1
fi

# Check if file exists
if [ ! -f "$FILE_PATH" ]; then
  echo -e "${RED}Error: File not found: $FILE_PATH${NC}"
  exit 1
fi

# Create a temporary test project
TEMP_DIR=$(mktemp -d)
trap 'rm -rf "$TEMP_DIR"' EXIT

echo -e "${BLUE}🔍 Testing specific Swift file: $FILE_PATH${NC}"

# Create project structure
mkdir -p "$TEMP_DIR/Sources/TestLib"
mkdir -p "$TEMP_DIR/Tests/TestSuite"

# Extract filename without extension for test naming
FILENAME=$(basename "$FILE_PATH" .swift)

# Create Package.swift
cat > "$TEMP_DIR/Package.swift" << EOF
// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "SwiftlingsTest",
    products: [
        .library(name: "TestLib", targets: ["TestLib"]),
    ],
    targets: [
        .target(name: "TestLib"),
        .testTarget(
            name: "TestSuite",
            dependencies: ["TestLib"],
            swiftSettings: [.define("TESTING")]
        ),
    ]
)
EOF

# Copy the target file to test
cp "$FILE_PATH" "$TEMP_DIR/Sources/TestLib/TargetFile.swift"

# Create a basic test file
cat > "$TEMP_DIR/Tests/TestSuite/TargetFileTests.swift" << EOF
import Testing
import TestLib

@Test("$FILENAME Test")
func test$FILENAME() {
  // Basic test to verify compilation
  #expect(true, "File compiles successfully")
}
EOF

# Build test project
echo -e "${YELLOW}Building test project...${NC}"
if [ "$VERBOSE" = true ]; then
  (cd "$TEMP_DIR" && swift build)
else
  (cd "$TEMP_DIR" && swift build > /dev/null)
fi

if [ $? -eq 0 ]; then
  echo -e "${GREEN}✅ File compiles successfully!${NC}"
else
  echo -e "${RED}❌ Compilation failed${NC}"
  exit 1
fi

# Run tests
echo -e "${YELLOW}Running tests...${NC}"
if [ "$VERBOSE" = true ]; then
  (cd "$TEMP_DIR" && swift test)
else
  (cd "$TEMP_DIR" && swift test > /dev/null)
fi

if [ $? -eq 0 ]; then
  echo -e "${GREEN}✅ Tests passed!${NC}"
else
  echo -e "${RED}❌ Tests failed${NC}"
  exit 1
fi

echo -e "${GREEN}✅ File '$FILENAME' tested successfully!${NC}"