# My Dotfiles.

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

### GitHub Authentication
For further information, go to the [GitHub Authentication Documentation](https://docs.github.com/en/authentication)

#### Checking for existing SSH keys
1. See if existing SSH keys are present: `ls -al ~/.ssh`
2. Check the directory listing to see if you already have a public SSH key
	* The filenames of supported public keys for GitHub are one of the following:
		* _id_rsa.pub_
		* _id_ecdsa.pub_
		* _id_ed25519.pub_

#### Generating a new SSH key
1. Create a new SSH key: `ssh-keygen -t ed25519 -C "your_email@example.com"`
	* This creates a new SSH key, using the provided email as a label
2.  When you're prompted to "Enter a file in which to save the key", press Enter to accept the default file location
3. At the prompt, type a secure passphrase (or empty for no passphrase)

#### Adding your SSH key to the ssh-agent
1. Start the ssh-agent in the background: `eval "$(ssh-agent -s)"`
2. Add your SSH private key to the ssh-agent: `ssh-add ~/.ssh/id_ed25519`
3. Add the SSH pulic key to your GitHub account

#### Adding a new SSH key to your GitHub account
1. Copy the SSH public key to your clipboard: `cat ~/.ssh/id_ed25519.pub`
	* Select and copy the output of the command
2. At [github.com](https://github.com), click your profile photo, then go to **Settings**
3. Go to **SSH and GPG keys** and click **New SSH key**
4. In the "Title" field, add a descriptive label for the new key
	* Eg. "Personal Laptop"
5. In the "Key" field, paste your public key
6. Click **Add SSH key**

#### Testing your SSH connection
1. Run `ssh -T git@github.com`
2. Verify that the resulting message contains your username
