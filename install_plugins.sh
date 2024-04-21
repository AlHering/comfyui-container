#!/bin/bash
source /comfyui-container/venv/bin/activate
cd /comfyui-container/comfyui/custom_nodes

# Clone repos
plugins=("https://github.com/ltdrdata/ComfyUI-Manager.git" "https://github.com/ltdrdata/ComfyUI-Impact-Pack.git" "https://github.com/ltdrdata/ComfyUI-Inspire-Pack.git" "https://github.com/jags111/efficiency-nodes-comfyui.git" "https://github.com/ssitu/ComfyUI_UltimateSDUpscale.git" "https://github.com/Suzie1/ComfyUI_Comfyroll_CustomNodes.git" "https://github.com/Fannovel16/comfyui_controlnet_aux.git" "https://github.com/cubiq/ComfyUI_IPAdapter_plus.git" "https://github.com/TinyTerra/ComfyUI_tinyterraNodes.git" "https://github.com/WASasquatch/was-node-suite-comfyui.git" "https://github.com/palant/image-resize-comfyui.git" "https://github.com/cubiq/ComfyUI_essentials.git" "https://github.com/Suzie1/ComfyUI_Comfyroll_CustomNodes.git" "https://github.com/Ttl/ComfyUi_NNLatentUpscale.git")
for plugin in "${plugins[@]}"
do
    git clone $plugin --recursive
done

# Handle requirements
pip install insightface==0.7.3 simpleeval==0.9.13
pip install segment-anything==1.0 omegaconf==2.3.0 
pip install -r comfyui_controlnet_aux/requirements.txt
pip install -r was-node-suite-comfyui/requirements.txt
pip install -r ComfyUI_essentials/requirements.txt

# Handle models
mkdir /comfyui-container/comfyui/models/clip_vision
ln -sf /comfyui-container/machine_learning_models/stable_diffusion/IPADAPTER /comfyui-container/comfyui/models/ipadapter
ln -sf /comfyui-container/machine_learning_models/stable_diffusion/CLIP /comfyui-container/comfyui/models/clip_vision

mkdir /comfyui-container/comfyui/custom_nodes/comfyui_controlnet_aux/ckpts/LiheYoung/
ln -sf /comfyui-container/machine_learning_models/misc/LiheYoung_Depth-Anything /comfyui-container/comfyui/custom_nodes/comfyui_controlnet_aux/ckpts/LiheYoung/Depth-Anything