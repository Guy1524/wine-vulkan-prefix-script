# wine-vulkan-prefix-script
I got annoyed at manually editing prefixes for vulkan and dxvk, so I made a script to do it for me.  

Details:  
as of 2/28/18 roderick's changes in roderickc/wine-vulkan have been merged into mainline wine. To play vulkan games you have to add some registry keys to the prefix, add a json file to the prefix, and install lunarg vulkan sdk to the prefix.  

if you want to use dxvk you also have to run a seperate bash script on the prefix.  

-THIS SCRIPT DOES ALL OF THAT FOR YOU.  

Usage:  

To setup vulkan in either wine-vulkan or latest wine/wine-staging (build 2/28/18 or higher):  

WINEARCH=the architecture you want for your prefix (win32/win64)  
WINEPREFIX=the folder for your wine prefix  
DXVK=1 set this if you also want to install dxvk for experimental dx11->vulkan rendering  

Examples:  

Windows vulkan game:  
WINEARCH=win64 WINEPREFIX=/some/directory/path/DOOM2016 bash installvulkan.sh  

Game with dxvk:  
WINEARCH=win64 WINEPREFIX=/some/directory/path/tombraider DXVK=1 bash installvulkan.sh  

Then launch your game as you normally would using that prefix.  

wine-vulkan source:
[wine-vulkan](http://github.com/roderickc/wine-vulkan)

dxvk source:
[dxvk](https://github.com/doitsujin/dxvk)