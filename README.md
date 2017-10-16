# Visual Studio 2017 Layout Cleanup

Visual Studio 15 doesn't distribute ISO's for offline installation, instead a "layout" must be configured using the vs_setup.exe installer using the "--layout <path>" parameter. However, if you keep using the same layout folder like I do, the size will keep growing as the old versions of the modules accumulate.

This script checks what modules were downloaded from the `Catalog.json` file in the layout folder and deletes older versions of the folders.
