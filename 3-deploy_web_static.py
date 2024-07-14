#!/usr/bin/python3
"""Creayes and distributes an archive to web servers."""


from fabric.api import *
from datetime import datetime
import os


env.hosts = ['52.3.246.175', '54.82.207.91']


def do_pack():
    """Generates the .tgz archive from web static."""
    local("sudo mkdir -p versions")
    now = datetime.now().strftime("%Y%m%d%H%M%S")
    name = f"versions/web_static_{now}.tgz"
    ans = local(f"sudo tar -cvzf {name} web_static")

    if ans.succeeded:
        return name
    else:
        return None


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


def deploy():
    """ creates and distributes an archive to your web servers."""
    if not os.path.exists(do_pack()):
        return False
    return do_deploy(do_pack())
