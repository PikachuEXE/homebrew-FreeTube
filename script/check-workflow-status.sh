#! /bin/bash
set -o errexit
set -o nounset

# Script to determine whether the upstream release.yml workflow was run
# and when it was last run, using the GitHub API.

# Replace placeholders with actual values
UPSTREAM_REPO="FreeTubeApp/FreeTube"
WORKFLOW_FILE="release.yml"
WORKFLOW_PATH=".github/workflows/$WORKFLOW_FILE"
# GITHUB_TOKEN="your_personal_access_token"

# Step 1: Get Workflow ID
WORKFLOW_ID=$(curl --silent \
  "https://api.github.com/repos/$UPSTREAM_REPO/actions/workflows" | \
  jq -r ".workflows[] | select(.path == \"$WORKFLOW_PATH\") | .id")

# Step 2: List Workflow Runs
LATEST_RUN=$(curl --silent \
  "https://api.github.com/repos/$UPSTREAM_REPO/actions/workflows/$WORKFLOW_ID/runs" | \
  jq -r ".workflow_runs[0]")

# Step 3: Extract Run Status and Timestamp
STATUS=$(jq -r ".status" <<< "$LATEST_RUN")
# The timestamp is in ISO 8601 format
TIMESTAMP_UTC=$(jq -r ".created_at" <<< "$LATEST_RUN")

# Step 4: Convert Timestamp to Local Timezone
# Check if Ruby is installed
if command -v ruby >/dev/null 2>&1; then
  # Ruby is installed, use it for precise timestamp conversion
  # Match the default output of the 'date' command
  TIMESTAMP_LOCAL=$(ruby -r 'time' -e "puts Time.parse('$TIMESTAMP_UTC').localtime.strftime('%a %b %d %H:%M:%S %Z %Y')")
  # Follow the ISO 8601 standard
  # TIMESTAMP_LOCAL=$(ruby -r 'time' -e "puts Time.parse('$TIMESTAMP_UTC').localtime.strftime('%Y-%m-%d %H:%M:%S %Z')")
else
  # Ruby is not installed
  # Check the operating system
  OS=$(uname -s)
  if [ "$OS" == "Darwin" ]; then
    # macOS
    # Use date command for less precise timestamp conversion
    # This approach might not be as precise as using Ruby, especially if dealing with daylight saving time changes.
    OFFSET=$(date +%z)

    # Extract the sign (+/-) and hours from the offset
    HOURS=${OFFSET:0:3}

    # Adjust timestamp using the -v option
    # Match the default output of the 'date' command
    TIMESTAMP_LOCAL=$(date -jf "%Y-%m-%dT%H:%M:%SZ" -v"${HOURS}H" "$TIMESTAMP_UTC" +"%a %b %d %H:%M:%S %Z %Y")
    # Follow the ISO 8601 standard
    # TIMESTAMP_LOCAL=$(date -jf "%Y-%m-%dT%H:%M:%SZ" -v"${HOURS}H" "$TIMESTAMP_UTC" +"%Y-%m-%d %H:%M:%S %Z")
  elif [ "$OS" == "Linux" ]; then
    # Linux
    # Use date command with --date option from GNU coreutils for precise timestamp conversion
    # Match the default output of the 'date' command
    TIMESTAMP_LOCAL=$(date --date="$TIMESTAMP_UTC" +"%a %b %d %H:%M:%S %Z %Y")
    # Follow the ISO 8601 standard
    # TIMESTAMP_LOCAL=$(date --date="$TIMESTAMP_UTC" +"%Y-%m-%d %H:%M:%S %Z")
  else
    # Unsupported OS, print UTC timestamp without changed formatting
    TIMESTAMP_LOCAL="$TIMESTAMP_UTC"
  fi
fi

# Step 5: Check Run Status and Print the Results
if [ "$STATUS" == "completed" ]; then
  printf "The %s workflow was last run successfully at %s.\n" "$WORKFLOW_FILE" "$TIMESTAMP_LOCAL"
else
  printf "The %s workflow has not been run or did not complete successfully.\n" "$WORKFLOW_FILE"
