#!/bin/bash

# Docker container name and target directory path
CONTAINER_NAME="php"  # Replace with your container name
TARGET_DIR="/var/www"  # Path where you want to install the project in the container

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No color

# Prompt the user to continue with the Symfony project creation
echo -e "${YELLOW}Do you want to create a Symfony project?${NC}"
select answer in "Yes" "No"; do
    case $answer in
        Yes)
            # Step 1: Create the Symfony project in the container
            echo -e "${GREEN}Creating Symfony project...${NC}"
            docker exec "$CONTAINER_NAME" sh -c "cd $TARGET_DIR && composer create-project symfony/skeleton skeleton --no-interaction"

            # Step 2: Move all contents from `skeleton`, including hidden files, to the parent directory
            docker exec "$CONTAINER_NAME" sh -c "cd $TARGET_DIR/skeleton && cp -a . .. && cd .. && rm -rf skeleton"
            echo -e "${GREEN}Symfony project created successfully!${NC}"
            break
            ;;
        No)
            echo -e "${RED}Operation cancelled.${NC}"
            exit 1
            ;;
        *)
            echo -e "${RED}Invalid option. Please select 'Yes' or 'No'.${NC}"
            ;;
    esac
done