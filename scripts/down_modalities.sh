#!/bin/bash

# Define arrays of target directories and URL files
TARGET_DIRS=(
'./datasets/image_net_100/train/depth'
'./datasets/image_net_100/train/semseg'
'./datasets/image_net_100/val/depth'
'./datasets/image_net_100/val/semseg'
)

URLS_FILES=(
'./down_modalities/depth_train.txt_new.txt'
'./down_modalities/semseg_train.txt_new.txt'
'./down_modalities/depth_val.txt_new.txt'
'./down_modalities/semseg_val.txt_new.txt'
)

# Loop over each pair of target directory and URL file
for index in "${!TARGET_DIRS[@]}"; do
    TARGET_DIR=${TARGET_DIRS[$index]}
    URLS_FILE=${URLS_FILES[$index]}

    # Ensure the target directory exists or try to create it
    if [ ! -d "$TARGET_DIR" ]; then
        mkdir -p "$TARGET_DIR"
    fi

    # Check if the target directory was created or if it exists
    if [ ! -d "$TARGET_DIR" ]; then
        echo "Failed to find or create the target directory: $TARGET_DIR"
        continue  # Skip to the next iteration
    fi

    # Ensure the URLs file exists
    if [ ! -f "$URLS_FILE" ]; then
        echo "URLs file does not exist: $URLS_FILE"
        continue  # Skip to the next iteration
    fi

    # Loop through each line in the URLs file
    while read -r line; do
        FILE_NAME=$(basename "$line")

        echo "Processing $FILE_NAME in $TARGET_DIR..."
        wget -c --show-progress "$line" -P "$TARGET_DIR"  # Download the file
        
        echo "Extracting $FILE_NAME..."
        tar -xf "$TARGET_DIR/$FILE_NAME" -C "$TARGET_DIR"
        
        # Optionally, remove the TAR file after extraction
        rm "$TARGET_DIR/$FILE_NAME"

    done < "$URLS_FILE"

    echo "All files in $URLS_FILE have been downloaded and extracted to $TARGET_DIR."
done

echo "Processing complete for all directories."
