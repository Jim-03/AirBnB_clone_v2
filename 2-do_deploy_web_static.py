#!/usr/bin/python3
"""Distributes an archive across web servers."""
from fabric.api import *
import os


env.hosts = ['52.3.246.175', '54.82.207.91']


def do_deploy(archive_path):
    """Distributes the archive."""
    if not os.path.exists(archive_path):
        return False

    filename = os.path.basename(archive_path)
    rel = filename.split('.')[0]
    folder = f"/data/web_static/releases/{rel}"

    try:
        put(archive_path, f"/tmp/{filename}")
        run(f"sudo mkdir -p {folder}")
        run(f"sudo tar -xzf /tmp/{filename} -C {folder}")
        run(f"sudo rm /tmp/{filename}")
        run(f"sudo mv {folder}/web_static/* {folder}/")
        run(f"sudo rm -rf {folder}/web_static")
        run(f"sudo rm -rf /data/web_static/current")
        run(f"sudo ln -s {folder} /data/web_static/current")
        return True
    except Exception as e:
        return False
