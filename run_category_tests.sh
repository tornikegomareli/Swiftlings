#!/bin/bash
# run_category_tests.sh - A script to run tests for a specific category
# Usage: ./run_category_tests.sh <category>
# Example: ./run_category_tests.sh Generics

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Default parameters
CATEGORY=""
VERBOSE=false
SPECIFIC_EXERCISE=""

# Parse command line arguments
while (( "$#" )); do
  case "$1" in
    --category|-c)
      CATEGORY="$2"
      shift 2
      ;;
    --exercise|-e)
      SPECIFIC_EXERCISE="$2"
      shift 2
      ;;
    --verbose|-v)
      VERBOSE=true
      shift
      ;;
    --help|-h)
      echo "Usage: ./run_category_tests.sh [OPTIONS]"
      echo ""
      echo "Options:"
      echo "  -c, --category CATEGORY  Run tests for a specific category (e.g., Generics) (required)"
      echo "  -e, --exercise EXERCISE  Run tests for a specific exercise (e.g., ex01_generics)"
      echo "  -v, --verbose            Show more detailed output"
      echo "  -h, --help               Show this help message"
      exit 0
      ;;
    *)
      # If no flag is provided, treat the first argument as the category
      if [[ -z "$CATEGORY" && "$1" != -* ]]; then
        CATEGORY="$1"
        shift
      else
        echo "Unknown option: $1"
        exit 1
      fi
      ;;
  esac
done

# List available categories
list_categories() {
  echo -e "Available categories:"
  for dir in src/Exercises/*/; do
    echo -e "  - $(basename "$dir")"
  done
}

# Check if category is provided
if [ -z "$CATEGORY" ]; then
  echo -e "${RED}Error: Category is required. Use --category option or provide it as the first argument.${NC}"
  list_categories
  exit 1
fi

# Normalize category name (first letter uppercase, rest lowercase)
CATEGORY_NORMALIZED="$(tr '[:lower:]' '[:upper:]' <<< ${CATEGORY:0:1})$(tr '[:upper:]' '[:lower:]' <<< ${CATEGORY:1})"

# Check if category exists
if [ ! -d "src/Exercises/$CATEGORY_NORMALIZED" ]; then
  echo -e "${RED}Error: Category '$CATEGORY_NORMALIZED' not found.${NC}"
  list_categories
  exit 1
fi

# Check if tests exist for the category
if [ ! -d "Tests/TestsForExercises/$CATEGORY_NORMALIZED" ]; then
  echo -e "${RED}Error: No tests found for category '$CATEGORY_NORMALIZED'.${NC}"
  exit 1
fi

# Construct filter pattern
FILTER_PATTERN=""
if [ -n "$SPECIFIC_EXERCISE" ]; then
  # Extract exercise number from the name (assuming format ex##_name)
  EXERCISE_NUM=$(echo "$SPECIFIC_EXERCISE" | grep -o -E 'ex[0-9]+' | head -1)
  if [ -z "$EXERCISE_NUM" ]; then
    echo -e "${RED}Error: Exercise name should contain pattern 'ex##' (e.g., ex01_generics)${NC}"
    exit 1
  fi
  
  # Convert to proper test naming pattern (Ex##Name)
  EXERCISE_PATTERN="Ex${EXERCISE_NUM#ex}"
  FILTER_PATTERN="$CATEGORY_NORMALIZED/$EXERCISE_PATTERN"
  
  echo -e "${BLUE}🧪 Running tests for exercise: $SPECIFIC_EXERCISE in category $CATEGORY_NORMALIZED${NC}"
else
  FILTER_PATTERN="$CATEGORY_NORMALIZED/"
  echo -e "${BLUE}🧪 Running all tests for category: $CATEGORY_NORMALIZED${NC}"
fi

# Display test files that will be run
if [ "$VERBOSE" = true ]; then
  echo -e "${YELLOW}Tests that will be run:${NC}"
  find "Tests/TestsForExercises/$CATEGORY_NORMALIZED" -name "*.swift" | while read -r test_file; do
    if [ -n "$SPECIFIC_EXERCISE" ]; then
      # Only show tests matching the specific exercise
      if grep -q "$EXERCISE_PATTERN" <<< "$(basename "$test_file")"; then
        echo "  - $(basename "$test_file")"
      fi
    else
      echo "  - $(basename "$test_file")"
    fi
  done
  echo ""
fi

# Run the tests for the specific category
echo -e "${YELLOW}Running tests...${NC}"

# Create a temp file for the output
TEMP_FILE=$(mktemp)
trap 'rm -f "$TEMP_FILE"' EXIT

# Build the command
TEST_CMD="swift test -c debug -Xswiftc -DTESTING --filter \"$FILTER_PATTERN\""

# Run the tests and capture output
if [ "$VERBOSE" = true ]; then
  echo -e "${YELLOW}Command: $TEST_CMD${NC}"
  eval "$TEST_CMD"
  TEST_EXIT_CODE=$?
else
  eval "$TEST_CMD" > "$TEMP_FILE" 2>&1
  TEST_EXIT_CODE=$?
  
  # Show the output in case of failure
  if [ $TEST_EXIT_CODE -ne 0 ]; then
    echo -e "${RED}❌ Some tests failed. Output:${NC}"
    cat "$TEMP_FILE"
  fi
fi

# Count the number of test files
if [ -n "$SPECIFIC_EXERCISE" ]; then
  TEST_FILES=$(find "Tests/TestsForExercises/$CATEGORY_NORMALIZED" -name "*$EXERCISE_PATTERN*.swift" | wc -l | tr -d ' ')
else
  TEST_FILES=$(find "Tests/TestsForExercises/$CATEGORY_NORMALIZED" -name "*.swift" | wc -l | tr -d ' ')
fi

# Show success/failure message
if [ $TEST_EXIT_CODE -eq 0 ]; then
  echo -e "${GREEN}✅ All tests passed!${NC}"
else
  echo -e "${RED}❌ Some tests failed.${NC}"
fi

echo -e "${BLUE}Ran $TEST_FILES test file(s) for $CATEGORY_NORMALIZED${NC}"

echo -e "\n${GREEN}✅ Test run completed for $CATEGORY_NORMALIZED${NC}"
echo -e "${YELLOW}Note:${NC} It's expected that tests may fail if you haven't completed the exercises yet."
echo -e "Tests are designed to pass when you correctly implement the exercise requirements."
echo -e "For exercises with compilation errors, fix the errors in the exercise files to make the tests pass."

exit $TEST_EXIT_CODE