#!/bin/bash
source /comfyui-container/venv/bin/activate
cd /comfyui-container/comfyui/custom_nodes

# Clone repos
plugins=("https://github.com/ltdrdata/ComfyUI-Manager.git" "https://github.com/ltdrdata/ComfyUI-Impact-Pack.git" "https://github.com/ltdrdata/ComfyUI-Inspire-Pack.git" "https://github.com/jags111/efficiency-nodes-comfyui.git" "https://github.com/ssitu/ComfyUI_UltimateSDUpscale.git" "https://github.com/Suzie1/ComfyUI_Comfyroll_CustomNodes.git" "https://github.com/Fannovel16/comfyui_controlnet_aux.git" "https://github.com/cubiq/ComfyUI_IPAdapter_plus.git" "https://github.com/TinyTerra/ComfyUI_tinyterraNodes.git" "https://github.com/WASasquatch/was-node-suite-comfyui.git")
for plugin in "${plugins[@]}"
do
    git clone $plugin --recursive
done

# Handle requirements
pip install insightface==0.7.3 simpleeval==0.9.13
pip install -r was-node-suite-comfyui/requirements.txt

# Manage prompt folder linking
ln -s /comfyui-container/stable_diffusion_prompts /comfyui-container/comfyui/custom_nodes/ComfyUI-Inspire-Pack/prompts
rm "/comfyui-container/comfyui/custom_nodes/ComfyUI-Inspire-Pack/prompts/mount stable diffusion prompt folders here.txt"
find /comfyui-container/comfyui/custom_nodes/ComfyUI-Inspire-Pack/prompts -xtype l -print -delete
