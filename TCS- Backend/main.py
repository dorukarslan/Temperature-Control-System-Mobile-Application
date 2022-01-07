from fastapi import FastAPI
from subapps.authorization_app import authorization
from subapps.user_app import user

app = FastAPI()

app.mount("/authorization", authorization)
app.mount("/user", user)


@app.get("/")
def alive():
    return {"message": "alive"}
