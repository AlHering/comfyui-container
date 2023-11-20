#!/bin/bash

source /comfyui-container/venv/bin/activate
cd /comfyui-container/comfyui
pip install --no-cache-dir torchvision==0.15.2+cu117 torchaudio==2.0.2+cu117 torch==2.0.1+cu117 xformers==0.0.20 --extra-index-url https://download.pytorch.org/whl/cu117
pip install --no-cache-dir -r requirements.txt
