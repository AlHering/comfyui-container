#!/bin/bash
source /comfyui-container/venv/bin/activate
cd /comfyui-container/comfyui/custom_nodes

plugins=("https://github.com/ltdrdata/ComfyUI-Manager.git")
for plugin in "${plugins[@]}"
do
    git clone $plugin
done

