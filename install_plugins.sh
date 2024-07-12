#!/bin/bash
COMFY_DIR="/comfyui-container/comfyui"
IMAGE_MODEL_DIR="/comfyui-container/machine_learning_models"
VENV_DIR="/comfyui-container/venv/bin/activate"

cd "${COMFY_DIR}/custom_nodes"

# Clone repos
plugins=("https://github.com/ltdrdata/ComfyUI-Manager.git" "https://github.com/ltdrdata/ComfyUI-Impact-Pack.git" "https://github.com/ltdrdata/ComfyUI-Inspire-Pack.git" "https://github.com/jags111/efficiency-nodes-comfyui.git" "https://github.com/ssitu/ComfyUI_UltimateSDUpscale.git" "https://github.com/Suzie1/ComfyUI_Comfyroll_CustomNodes.git" "https://github.com/Fannovel16/comfyui_controlnet_aux.git" "https://github.com/cubiq/ComfyUI_IPAdapter_plus.git" "https://github.com/TinyTerra/ComfyUI_tinyterraNodes.git" "https://github.com/WASasquatch/was-node-suite-comfyui.git" "https://github.com/palant/image-resize-comfyui.git" "https://github.com/cubiq/ComfyUI_essentials.git" "https://github.com/Suzie1/ComfyUI_Comfyroll_CustomNodes.git" "https://github.com/Ttl/ComfyUi_NNLatentUpscale.git" "https://github.com/pythongosssss/ComfyUI-Custom-Scripts.git" "https://github.com/cubiq/ComfyUI_InstantID.git" "https://github.com/kijai/ComfyUI-LivePortraitKJ.git")
for plugin in "${plugins[@]}"
do
    git clone $plugin --recursive
done

# Handle requirements
source $VENV_DIR && pip install --no-cache-dir insightface==0.7.3 simpleeval==0.9.13
source $VENV_DIR && pip install --no-cache-dir segment-anything==1.0 omegaconf==2.3.0 
source $VENV_DIR && pip install --no-cache-dir -r comfyui_controlnet_aux/requirements.txt
source $VENV_DIR && pip install --no-cache-dir -r was-node-suite-comfyui/requirements.txt
source $VENV_DIR && pip install --no-cache-dir -r ComfyUI_essentials/requirements.txt
source $VENV_DIR && pip install --no-cache-dir -r ComfyUI_InstantID/requirements.txt
source $VENV_DIR && pip install --no-cache-dir -r ComfyUI-LivePortraitKJ/requirements.txt

# Handle models
ln -sf "${IMAGE_MODEL_DIR}/stable_diffusion/IPADAPTER" "${COMFY_DIR}/models/ipadapter"
ln -sf "${IMAGE_MODEL_DIR}/stable_diffusion/CLIP" "${COMFY_DIR}/models/clip_vision"

mkdir -p "${COMFY_DIR}/custom_nodes/comfyui_controlnet_aux/ckpts/LiheYoung/"
ln -sf "${IMAGE_MODEL_DIR}/misc/LiheYoung_Depth-Anything" "${COMFY_DIR}/custom_nodes/comfyui_controlnet_aux/ckpts/LiheYoung/Depth-Anything"
ln -sf "${IMAGE_MODEL_DIR}/misc/Kijai_LivePortrait_safetensors" "${COMFY_DIR}/models/liveportrait"

