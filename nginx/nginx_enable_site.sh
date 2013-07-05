#!/bin/bash

# Check we're root
if [ "$(id -u)" != "0" ]; then
  echo "{ \"version\": 1, \"title\": \"Enabling $1 site\", \"type\":\"status\", \"status\":\"failed\", \"message\":\"you must be root to do this\"}"
  exit 1
fi

# Add a symlink for this site
ln -s /etc/nginx/sites-available/$1 /etc/nginx/sites-enabled/$1 > /dev/null 2>&1
nginx -s reopen > /dev/null 2>&1
echo "{ \"version\": 1, \"title\": \"Enabling $1 site\", \"type\":\"status\", \"status\":\"ok\", \"message\":\"success\"}"