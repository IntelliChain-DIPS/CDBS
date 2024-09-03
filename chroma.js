const express = require('express');
const { ChromaClient } = require('chromadb');

const app = express();
const port = 3124;
const client = new ChromaClient();

app.use(express.json());

app.post('/add', async (req, res) => {
    const { ids, embeddings } = req.body;
    try {
        const collection = await client.get_or_create_collection({ name: "my_collection" });
        await collection.add({ ids, embeddings });
        res.status(200).send('Documents added successfully');
    } catch (error) {
        res.status(500).send('Error adding documents');
    }
});

app.post('/query', async (req, res) => {
    const { query_texts, n_results } = req.body;
    try {
        const collection = await client.get_or_create_collection({ name: "my_collection" });
        const results = await collection.query({ query_texts, n_results });
        res.status(200).json(results);
    } catch (error) {
        res.status(500).send('Error querying documents');
    }
});

app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
});