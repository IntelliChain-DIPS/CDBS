# Chroma DB Setup

This repository is for setting up the Chroma DB.

## Installation

1. Install the Chroma DB:
   ```sh
   pip install chromadb
   ```

2. Run the Chroma DB:
   ```sh
   chroma run --path /vector_db
   ```

# Automation

- The bash script `setup.sh` is for automating the installation and running of the Chroma DB.
- Please make sure to make the `setup.sh` script executable:
   ```sh
   chmod +x setup.sh
   ```
- This script will install the Chroma DB in a virtual environment.
- If you get permission denied errors, try running `sudo ./setup.sh`.

## Future Work
- Add some more automation and settings for configuring the Chroma DB.
- Deployable on the cloud