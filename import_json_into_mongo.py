import pymongo
import json
from pymongo import MongoClient, InsertOne

client = pymongo.MongoClient(r"mongodb+srv://root:Marczewsk1@owshq-mongodb-ws.fycylhb.mongodb.net/test")
db = client.dbmds
collection = db.stripe
requesting = []

with open(r"data/stripe.json") as f:
    for jsonObj in f:
        myDict = json.loads(jsonObj)
        requesting.append(InsertOne(myDict))

result = collection.bulk_write(requesting)
client.close()