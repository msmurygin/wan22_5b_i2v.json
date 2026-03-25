FROM runpod/worker-comfyui:5.5.1-base

# Install required custom nodes
RUN comfy node install comfyui-kjnodes --mode remote
RUN comfy node install comfyui-videohelpersuite --mode remote
RUN comfy node install comfyui-wanvideowrapper --mode remote

# download models
RUN comfy model download --url https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/text_encoders/umt5_xxl_fp16.safetensors --relative-path models/clip --filename umt5_xxl_fp16.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/diffusion_models/wan2.2_ti2v_5B_fp16.safetensors --relative-path models/diffusion_models/Wan2.2 --filename wan2.2_ti2v_5B_fp16.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/vae/wan2.2_vae.safetensors --relative-path models/vae --filename wan2.2_vae.safetensors
