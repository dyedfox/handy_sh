#!/bin/bash

# Specify credentials
username="your_username"
password="your_password"

# Specify the file containing repository URLs
repo_list_file="repository_list.txt"

# Check if the file exists
if [ ! -f "$repo_list_file" ]; then
    echo "Error: Repository list file not found."
    exit 1
fi

# Loop through each line in the file and clone the repository
while IFS= read -r repo_url; do
    # Check if the line is not empty or a comment (starting with #)
    if [ -n "$repo_url" ] && [ "${repo_url:0:1}" != "#" ]; then
        # Extract repository URL without the protocol
        repo_url_without_protocol="${repo_url#*://}"
        
        # Add credentials to the repository URL
        repo_url_with_credentials="https://$username:$password@$repo_url_without_protocol"
        
        echo "Cloning repository: $repo_url"
        git clone "$repo_url_with_credentials"
        
        # Check if the clone was successful
        if [ $? -ne 0 ]; then
            echo "Error: Failed to clone repository: $repo_url"
        fi
    fi
done < "$repo_list_file"

echo "Cloning completed."
