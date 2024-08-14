import sysconfig
from time import sleep
from asyncio import sleep as async_sleep

from fastapi import FastAPI

if sysconfig.get_config_var("Py_GIL_DISABLED") == 1:
    print("disable-gil")
else:
    print("enable-gil")
app = FastAPI()


@app.get("/sync")
def read_root():
    return {"message": "Hello, World!"}


@app.get("/async")
async def read_root():
    return {"message": "Hello, World!"}


@app.get("/sleep")
def test_sleep():
    sleep(0.1)
    return {"message": "sleep"}


@app.get("/async_sleep")
async def test_async_sleep():
    await async_sleep(0.1)
    return {"message": "sleep"}


@app.get("/async_sleep")
async def test_async_sleep():
    await async_sleep(0.1)
    return {"message": "sleep"}
