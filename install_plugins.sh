#!/bin/bash

source /comfyui-container/venv/bin/activate
cd /mnt/Workspaces/Workspaces/docker/stable-diffusion/comfyui-container/comfyui/custom_nodes

plugins=("https://github.com/ltdrdata/ComfyUI-Manager.git")
for plugin in "${plugins[@]}"
do
    git clone $plugin
done

