#!/bin/bash

source /comfyui-container/venv/bin/activate
cd /comfyui-container
ln -sf /comfyui-container/stable_diffusion_output/ comfyui/output
pip install --no-cache-dir torchvision==0.17.1+cu121 torchaudio==2.2.1+cu121 torch==2.2.1+cu121 xformers --extra-index-url https://download.pytorch.org/whl/cu121
pip install --no-cache-dir -r requirements.txt
