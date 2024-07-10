export XDG_CONFIG_HOME="$HOME/.config"
export XDG_SCREENSHOTS_DIR="$HOME/Pictures/Screenshots"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

export VULKAN_SDK=$HOME/VulkanSDK/1.3.280.1/x86_64
export PATH=$VULKAN_SDK/bin:$PATH
export LD_LIBRARY_PATH=$VULKAN_SDK/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
export VK_LAYER_PATH=$VULKAN_SDK/share/vulkan/explicit_layer.d

export QT_QPA_PLATFORMTHEME=qt5ct

export QT_IM_MODULE=fcitx
export INPUT_METHOD=fcitx
export GLFW_IM_MODULE=ibus
export SDL_IM_MODULE=fcitx

export RANGER_LOAD_DEFAULT_RC=TRUE

export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="librewolf"

export PATH=$PATH:~/.cargo/bin
export PATH=$PATH:~/.local/bin

export GDK_BACKEND="wayland"
