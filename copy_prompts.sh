#!/bin/bash
echo Removing the following directories:
find /comfyui-container/comfyui/custom_nodes/ComfyUI-Inspire-Pack/prompts/ -mindepth 1 -maxdepth 1 -type d \( ! -name example \) -print
find /comfyui-container/comfyui/custom_nodes/ComfyUI-Inspire-Pack/prompts/ -mindepth 1 -maxdepth 1 -type d \( ! -name example \) -exec rm -rf "{}" \;
echo Removing the following files:
find /comfyui-container/comfyui/custom_nodes/ComfyUI-Inspire-Pack/prompts/ -type f \( ! -name put_prompts_dirs_here \) -print
find /comfyui-container/comfyui/custom_nodes/ComfyUI-Inspire-Pack/prompts/ -type f \( ! -name put_prompts_dirs_here \) -delete

cp -Ru /comfyui-container/stable_diffusion_prompts /comfyui-container/comfyui/custom_nodes/ComfyUI-Inspire-Pack/prompts/shared
