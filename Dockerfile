# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
# The workflow includes custom nodes from an unknown registry but no aux_id (GitHub repo) was provided for any of them,
# so they could not be resolved or installed automatically. Please provide GitHub repo links (aux_id) for these
# packages if you want them cloned into /comfyui/custom_nodes/.
# Could not resolve unknown_registry node: LoadWanVideoT5TextEncoder
# Could not resolve unknown_registry node: WanVideoTextEncode
# Could not resolve unknown_registry node: WanVideoModelLoader
# Could not resolve unknown_registry node: WanVideoSampler
# Could not resolve unknown_registry node: WanVideoDecode
# Could not resolve unknown_registry node: WanVideoTorchCompileSettings
# Could not resolve unknown_registry node: WanVideoVAELoader
# Could not resolve unknown_registry node: WanVideoEncode
# Could not resolve unknown_registry node: ImageResizeKJv2
# Could not resolve unknown_registry node: WanVideoEmptyEmbeds
# Could not resolve unknown_registry node: WanVideoExperimentalArgs
# Could not resolve unknown_registry node: WanVideoSLG
# Could not resolve unknown_registry node: VHS_VideoCombine
# Could not resolve unknown_registry node: WanVideoEasyCache

# download models into comfyui
RUN comfy model download --url https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/text_encoders/umt5_xxl_fp16.safetensors --relative-path models/clip --filename umt5_xxl_fp16.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/diffusion_models/wan2.2_ti2v_5B_fp16.safetensors --relative-path models/diffusion_models/Wan2.2 --filename wan2.2_ti2v_5B_fp16.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/blob/main/split_files/vae/wan2.2_vae.safetensors --relative-path models/vae --filename wan2.2_vae.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
