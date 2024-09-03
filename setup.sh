echo "Install these packages to continue, python (version 3), pip, python-xyz"
echo "Will install packages in chromaenv virtual environment"
python3 -m venv chromaenv
source chromaenv/bin/activate
pip install chromadb
# pip install chromadb-client
mkdir ./vector_db
echo "Changing permissions of ./vector_db to allow Chroma to write to it"
sudo chown -R $USER:$USER ./vector_db
pwd
echo "Starting Chroma vector database"
nohup chroma run --path ./vector_db --port 8001 > chroma.log 2>&1 &
echo "There is also a test.py file that you can run to test the vector database"
echo "To exit the virtual environment, type 'deactivate' or run with --deactivate-after | -DA"
yarn add express chromadb chromadb-default-embed 
npm install
npm start

if [[ "$1" == "--deactivate-after" || "$1" == "-DA" ]]; then
    echo "Deactivating virtual environment"
    deactivate
    echo "Virtual environment deactivated"
fi
