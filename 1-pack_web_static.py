#!/usr/bin/python3
"""Generates a .tgz archive."""
from fabric.api import *
from datetime import datetime


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
