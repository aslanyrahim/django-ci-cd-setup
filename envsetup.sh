#!/bin/bash

if [-d "venv"]
then
    echo "Python virtual env exists!"
else
    python3 -m venv venv
fi

echo $PWD
source venv/bin/activate

pip install -r requirements.txt

if [-d "logs"]
then
    echo "Log folder exists!"
else
    python3 -m venv venv
fi

sudo chmod -R 777 logs
echo "venv setup complete"