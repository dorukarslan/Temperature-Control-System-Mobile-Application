from fastapi.responses import JSONResponse
from fastapi import FastAPI, Request
from pydantic import BaseModel
from core.db_items import *
import bcrypt, time, re, jwt, os


class credentials(BaseModel):
    email: str
    password: str


authorization = FastAPI()
jwt_secret = os.environ.get("JWT_SECRET")

email_regex = r"(^[a-zA-Z0-9.+-]+@[a-zA-Z0-9-]+.[a-zA-Z0-9-.]+$)"


@authorization.post("/login/")
async def login(user: credentials, request: Request):
    try:
        if not re.match(email_regex, user.email):
            return JSONResponse(
                status_code=400,
                content={
                    "status": "failed",
                    "message": "Invalid email Format!. Try Again!",
                },
            )
        data = users_col().find_one({"email": user.email})
        bcrypt_pass = str.encode(user.password)
        hashed = data["password"]
        if bcrypt.checkpw(bcrypt_pass, hashed):
            client_ip = request.client.host
            ts = time.time()
            q = {"email": data["email"], "ip": client_ip, "timestamp": ts}
            last_activity().insert_one(q)
            token = jwt.encode(
                {"email": user.email, "timestamp": ts}, jwt_secret, algorithm="HS256"
            )
            if user.email == "admin@gmail.com":
                return {"status": "admin", "token": token}
            else:
                return {"status": "success", "token": token}
        else:
            return {
                "status": "failed",
                "message": "Email or password is wrong",
            }
    except:
        return JSONResponse(
            status_code=400,
            content={
                "status": "failed",
                "message": "Database error!",
            },
        )


@authorization.post("/register/")
async def register(user: credentials):
    try:
        if not re.match(email_regex, user.email):
            return JSONResponse(
                status_code=400,
                content={
                    "status": "failed",
                    "message": "Invalid email Format!. Try Again!",
                },
            )
        bcrypt_pass = str.encode(user.password)
        hashed = bcrypt.hashpw(bcrypt_pass, bcrypt.gensalt())
        ts = time.time()
        q = {
            "email": user.email,
            "password": hashed,
            "addresses": [],
            "timestamp": ts,
        }
        users_col().insert_one(q)
        token = jwt.encode(
            {"email": user.email, "timestamp": ts}, jwt_secret, algorithm="HS256"
        )
        return {"status": "success", "token": token}
    except:
        return JSONResponse(
            status_code=400,
            content={
                "status": "failed",
                "message": "Database error!",
            },
        )
