import pymongo, os

db_url = os.environ.get("DB_URL")
client = pymongo.MongoClient(db_url)
db = os.environ.get("DB_NAME")


def users_col():
    return client[db]["users"]


def last_activity():
    return client[db]["last_activity"]


def day_kw():
    return client[db]["day_kw"]
