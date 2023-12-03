#!/bin/bash

if [ -z "$UPSTREAM_REPO" ]; then
  echo "Cloning main Repository"
  git clone https://github.com/dhanush2bot/LazyPrincess
else
  echo "Cloning Custom Repo from $UPSTREAM_REPO"
  git clone "$UPSTREAM_REPO" /LazyPrincess
fi

if [ $? -eq 0 ]; then
  cd /LazyPrincess
  pip3 install -U -r requirements.txt

  if [ $? -eq 0 ]; then
    echo "Starting Bot...."
    python3 bot.py
  else
    echo "Error: Pip install failed."
  fi
else
  echo "Error: Git clone failed."
fi
