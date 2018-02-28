#!/bin/bash

cp winevulkan.json $WINEPREFIX/drive_c/windows/
if [ ! -f VulkanSDK-1.0.51.0-Installer.exe ]; then
    wget https://vulkan.lunarg.com/sdk/download/1.0.51.0/windows/VulkanSDK-1.0.51.0-Installer.exe
fi
WINEARCH=$WINEARCH WINEPREFIX=$WINEPREFIX wine VulkanSDK-1.0.51.0-Installer.exe

WINEARCH=$WINEARCH WINEPREFIX=$WINEPREFIX regedit vulkan.reg

if [ -z "$DXVK" ]; then
    wineserver -k
    exit
else
    if [ ! -d "$WINEARCH" ]; then
        mkdir $WINEARCH
        wget -O $WINEARCH/dxgi.dll https://haagch.frickel.club/files/dxvk/latest/64/bin/dxgi.dll
        wget -O $WINEARCH/d3d11.dll https://haagch.frickel.club/files/dxvk/latest/64/bin/d3d11.dll
        wget -O $WINEARCH/setup_dxvk.sh https://haagch.frickel.club/files/dxvk/latest/64/bin/setup_dxvk.sh
    fi
    WINEARCH=$WINEARCH WINEPREFIX=$WINEPREFIX bash $WINEARCH/setup_dxvk.sh
fi
wineserver -k
exit