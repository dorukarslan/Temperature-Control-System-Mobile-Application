from fastapi.responses import JSONResponse
from fastapi import FastAPI, Request
from pydantic import BaseModel
from core.db_items import *
import time, jwt, os

user = FastAPI()
jwt_secret = os.environ.get("JWT_SECRET")


class address(BaseModel):
    full: str


@user.middleware("http")
async def auth_middleware(request: Request, call_next):
    try:
        index = str(request.url).index("=")
        token = str(request.url)[index:]
        print(jwt_secret)
        data = jwt.decode(token[1:], jwt_secret, algorithms=["HS256"])
        request.state.email = data["email"]
        response = await call_next(request)
        return response
    except:
        return JSONResponse(status_code=403)


@user.post("/address/add/")
async def add_address(address: address, request: Request):
    users_col().update_one(
        {"email": request.state.email}, {"$addToSet": {"addresses": address.full}}
    )
    return {"message": "success"}


@user.get("/address/get/")
async def get_address(request: Request):
    data = users_col().find_one({"email": request.state.email})
    return {"data": data["addresses"]}


@user.get("/estimated-bill/")
async def get_address(request: Request):
    total = 0
    count = 0
    for x in day_kw().find({}, {"_id": 0}):
        total = total + x["kw"]
        count = count + 1

    bill = (total / count) * 0.71 * 30
    return round(bill, 2)
