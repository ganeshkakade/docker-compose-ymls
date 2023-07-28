#!/bin/bash

# Get the list of share volumes from the user
read -p "Enter the list of share volumes: " -a share_volumes

# Get the hard-coded list of share volumes
share_volumes_hardcoded=(
  "share_movies"
  "share_tv"
  "share_music"
  "share_books"
  "share_downloads"
)

# Combine the user-provided list of share volumes with the hard-coded list of share volumes
share_volumes=( "${share_volumes[@]}" "${share_volumes_hardcoded[@]}" )
	
# Check if the combined share_volumes list exists
if [ ${#share_volumes[@]} -gt 0 ]; then
  # Create the share volumes
  for share_volume in "${share_volumes[@]}"; do
    docker volume create "$share_volume"
  done

  echo "The share volumes have been created."
else
  echo "No share volumes provided. Skipping volume creation."
fi
