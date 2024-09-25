from os import path

import requests

from config import DATA_DIR, INDICES_FOLDER, NSE_INDEX_MAP
from utils.utils import random_user_agent


def download_file(url: str):
    filename = url.split("/")[-1]
    local_path = INDICES_FOLDER / filename
    chunk_size = 1024
    try:
        # Send a GET request to the URL with stream=True
        response = requests.get(url, stream=True, headers={'User-Agent': random_user_agent()})
        # Check if the response status is 200 (OK)
        if response.status_code == 200:
            # Open the file in binary write mode
            with open(local_path, "wb") as file:
                # Iterate over the response in chunks
                for chunk in response.iter_content(chunk_size=chunk_size):
                    # Filter out keep-alive chunks
                    if chunk:
                        file.write(chunk)
            print(f"Downloaded {filename} successfully.")
        else:
            print(f"Failed to download {filename}. HTTP Status: {response.status_code}")
    except Exception as e:
        print(f"Failed to download {filename}. Error: {e}")


async def check_and_download():
    for url in NSE_INDEX_MAP:
        filename = url.split("/")[-1]
        local_path = INDICES_FOLDER / filename
        if not path.exists(local_path):
            print(f"{filename} does not exist locally. Downloading...")
            download_file(url)
        else:
            print(f"{filename} already exists locally. Skipping download.")


async def get_url_content(url: str):
    try:
        response = requests.get(url, headers={'User-Agent': random_user_agent()})
        if response.status_code == 200:
            return response.content
    except Exception as e:
        return ""
