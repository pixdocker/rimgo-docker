#!/bin/bash

VERSION_FILE="commit.txt"

update_version_file() {
    echo "Updating version file with the latest version: $1"
    echo "$1" > "$VERSION_FILE"
    curl -s -X POST "https://api.telegram.org/bot$BOT_TOKEN/sendMessage" -F chat_id="$CHAT_ID" -F message_thread_id="$TOPIC_ID" \
                      -F text="New Rimgo Found Commit: $1 "> /dev/null
}

# commit_update(){
#     git config --local user.name "Github Action"
#     git config --local user.email "action@github.com"
#     git add --all
#     git commit -m "Commit hash: $1"
#     git push
# }

# Read the current commit from the file
current_commit=$(<"$VERSION_FILE")


json_response=$(curl -X 'GET' \
  'https://codeberg.org/api/v1/repos/rimgo/rimgo/commits?page=1&limit=1' \
  -H 'accept: application/json')

latest_commit=$(echo "$json_response" | jq -r '.[0].sha')

# Compare commit hash
if [ "$latest_commit" != "$current_commit" ]; then
    update_version_file "$latest_commit"
    # commit_update "$latest_commit"
else
  echo "No New Commit found"
fi

echo "Script execution completed."
