# HyprPuter - Hyprland on my Computer

## Installation

1. Edit the package list at `install/packages.yaml` (make sure to follow the syntax)
2. Run the install script at `install/install.sh`
3. Reboot you computer
4. Create a new Librewolf profile
5. Copy the `userChrome.css` to `the-new-profile/chrome/`
6. Download the BetterDiscord appimage
7. Run the appimage
8. Copy the BetterDiscord theme file to where it should be
9. (optional) Grab a cool avatar image and put it at `~/Dotfiles/Avatar.png`

## Some Post Installation Configuration

### Auto Login
You can find the full guide on the [wiki](https://wiki.archlinux.org/title/Getty#Automatic_login_to_virtual_console)

1. Create a drop-in file for `getty@tty1.service`
```bash
mkdir /etc/systemd/system/getty@tty1.service.d
sudoedit /etc/systemd/system/getty@tty1.service.d/autologin.conf
```
2. Copy the following contents, replace `YOUR_USERNAME` with the username you want to auto login
```
[Service]
ExecStart=
ExecStart=-/sbin/agetty -o '-p -f -- \\u' --noclear --autologin YOUR_USERNAME %I $TERM
```
3. Reboot your system, and it should auto login!

### Installing the Vulkan SDK
According to the [Getting Started Page](https://vulkan.lunarg.com/doc/sdk/1.3.280.1/linux/getting_started.html) from [vulkan.lunarg.com](https://vulkan.lunarg.com):

1. Install some required packages (it is already done through the install script)
```bash
sudo pacman -S xz qt5-base libxcb libxinerama
```
2. Also install the Vulkan driver for your hardware (also done through the script)
```bash
sudo pacman -S vulkan-intel
```
3. Download the SDK from [here](https://vulkan.lunarg.com/sdk/home)
4. Generate the sha256sum to make sure you didn't download something sus
```bash
sha256sum $HOME/VulkanSDK/vulkansdk-linux-x86_64-1.x.yy.z.tar.xz
# Check it with the one listed on the website next to the download link
```
5. Extract the SDK
```bash
tar xf $HOME/VulkanSDK/vulkansdk-linux-x86_64-1.x.yy.z.tar.xz
```
6. Set up the runtime environment
```bash
# Add these lines to your .zshenv
export VULKAN_SDK=~/vulkan/1.x.yy.z/x86_64
export PATH=$VULKAN_SDK/bin:$PATH
export LD_LIBRARY_PATH=$VULKAN_SDK/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
export VK_LAYER_PATH=$VULKAN_SDK/share/vulkan/explicit_layer.d

# or run this to temporary set the environment variables
source ~/VulkanSDK/1.x.yy.z/setup-env.sh
```
7. Run `vkcube` or `vulkaninfo` or `vkvia` to verify the installation

### Stop Discord from Forcing You to Update
Add this line to `~/.config/discord/settings.json`:
```json
"SKIP_HOST_UPDATE": true
```
