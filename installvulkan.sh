#!/bin/bash

cp winevulkan.json "$WINEPREFIX"/drive_c/windows/

WINEARCH=$WINEARCH WINEPREFIX="$WINEPREFIX" wine regedit /S vulkan.reg

if [ ! -f VulkanSDK-1.0.51.0-Installer.exe ]; then
    wget https://vulkan.lunarg.com/sdk/download/1.0.51.0/windows/VulkanSDK-1.0.51.0-Installer.exe
fi

WINEARCH=$WINEARCH WINEPREFIX="$WINEPREFIX" wine VulkanSDK-1.0.51.0-Installer.exe

if [ -z "$DXVK" ]; then
    wineserver -k
    exit
else
    if [ ! -d "$WINEARCH" ]; then
        mkdir $WINEARCH
        URLPREFIX=${WINEARCH:3}
        curl https://haagch.frickel.club/files/dxvk/latest/"$URLPREFIX"/bin/dxgi.dll -o $WINEARCH/dxgi.dll 
        curl https://haagch.frickel.club/files/dxvk/latest/"$URLPREFIX"/bin/d3d11.dll -o $WINEARCH/d3d11.dll
        curl https://haagch.frickel.club/files/dxvk/latest/"$URLPREFIX"/bin/setup_dxvk.sh -o $WINEARCH/setup_dxvk.sh
    fi
    WINEARCH=$WINEARCH WINEPREFIX="$WINEPREFIX" bash $WINEARCH/setup_dxvk.sh
fi
wineserver -k
exit
