#!/usr/bin/env bash

# Script to setup an AOSP Build environment on Ubuntu and Linux Mint

UBUNTU_16_PACKAGES="libesd0-dev"
UBUNTU_20_PACKAGES="libncurses5 curl"
DEBIAN_10_PACKAGES="libncurses5"
DEBIAN_11_PACKAGES="libncurses5"
PACKAGES=""

sudo apt update

# Install lsb-core packages
# sudo apt install lsb-core -y

LSB_RELEASE="$(lsb_release -d | cut -d ':' -f 2 | sed -e 's/^[[:space:]]*//')"

if [[ ${LSB_RELEASE} =~ "Mint 18" || ${LSB_RELEASE} =~ "Ubuntu 16" ]]; then
    PACKAGES="${UBUNTU_16_PACKAGES}"
elif [[ ${LSB_RELEASE} =~ "Ubuntu 20" || ${LSB_RELEASE} =~ "Ubuntu 21" || ${LSB_RELEASE} =~ "Ubuntu 22" || ${LSB_RELEASE} =~ 'Pop!_OS 2' ]]; then
    PACKAGES="${UBUNTU_20_PACKAGES}"
elif [[ ${LSB_RELEASE} =~ "Debian GNU/Linux 10" ]]; then
    PACKAGES="${DEBIAN_10_PACKAGES}"
elif [[ ${LSB_RELEASE} =~ "Debian GNU/Linux 11" ]]; then
    PACKAGES="${DEBIAN_11_PACKAGES}"
elif [[ ${LSB_RELEASE} =~ "Deepin 20" || ${LSB_RELEASE} =~ "Deepin 23" ]]; then
    PACKAGES="${UBUNTU_20_PACKAGES}"
fi

sudo DEBIAN_FRONTEND=noninteractive \
    apt install \
    git-core gnupg flex bison gperf build-essential zip curl \
    zlib1g-dev gcc-multilib g++-multilib libc6-dev \
    x11proto-core-dev libx11-dev ccache libgl1-mesa-dev libxml2-utils xsltproc unzip \
    libssl-dev zip lzip ncurses-dev patch make \
    ${PACKAGES} -y

echo -e "Setting up udev rules for adb!"
sudo curl --create-dirs -L -o /etc/udev/rules.d/51-android.rules -O -L https://raw.githubusercontent.com/M0Rf30/android-udev-rules/master/51-android.rules
sudo chmod 644 /etc/udev/rules.d/51-android.rules
sudo chown root /etc/udev/rules.d/51-android.rules
sudo systemctl restart udev

echo "Installing repo"
sudo curl --create-dirs -L -o /usr/bin/repo -O -L https://storage.googleapis.com/git-repo-downloads/repo
sudo chmod a+rx /usr/bin/repo


