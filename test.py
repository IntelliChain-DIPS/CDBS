import asyncio
import chromadb

async def main():
    client = await chromadb.AsyncHttpClient(host="localhost", port=8000)
    collection = await client.get_or_create_collection(name="my_collection")

    await collection.add(
        documents=["hello world"],
        ids=["id1"]
    )
    print("Added document to collection")

    results = await collection.query(
        query_texts=["hello world"],
        n_results=1
    )
    print("Query results:", results)

asyncio.run(main())
