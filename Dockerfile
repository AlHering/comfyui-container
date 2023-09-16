FROM nvidia/cuda:11.7.1-devel-ubuntu20.04
ENV PYTHONUNBUFFERED 1

# Setting up basic repo 
ARG DEBIAN_FRONTEND=noninteractive
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,utility
ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Setting up working directory
ADD ./ comfyui-container/
WORKDIR /comfyui-container
ENV RUNNING_IN_DOCKER True
COPY . .

# Install prerequisits
RUN apt-get update && apt-get install -y apt-utils \
    software-properties-common \
    && add-apt-repository ppa:deadsnakes/ppa -y
RUN apt-get update && apt-get install -y \
    make build-essential wget curl git nano ffmpeg libsm6 libxext6 \
    p7zip-full p7zip-rar \
    python3.10 python3.10-distutils python3.10-dev python3.10-venv \
    libgoogle-perftools4 libtcmalloc-minimal4 libgoogle-perftools-dev \
    pkg-config libcairo2-dev libjpeg-dev libgif-dev && apt-get clean -y

# Create venv
RUN if [ ! -d "venv" ]; \
    then \
    python3.10 -m venv venv; \
    fi

# Access port
ENV PORT 9090
EXPOSE $PORT

# Setup invokeai
RUN cd /comfyui-container && /bin/bash install_webui.sh

# Command for starting webui
CMD ["/bin/bash", "run_webui.sh"]
