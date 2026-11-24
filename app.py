from fastapi import FastAPI

from calc import add

app = FastAPI()


@app.get("/ready")
def ready():
    return {"status": "ok"}


@app.get("/add")
def add_route(a: int, b: int):
    return {"result": add(a, b)}
