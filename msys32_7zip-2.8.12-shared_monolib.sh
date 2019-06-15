# This file is designed to be ran from (git for Windows) bash shell

# import local settings file
source local_settings.sh

# Change to git folder
cd $WXWIDGETS_2_8_REPO || exit 1
# pwd

# Change to correct wxWidgets Git branch
# git lfs install
git checkout $WXWIDGETS_2_8_LFS_BRANCH || exit 2
# git status -uno


mkdir -p wxMSW-2.8.12_gcc${MSYS2_COMPILER_VERSION}_dllmono_Dev/lib
cp --recursive --update --preserve lib/gcc${MSYS2_COMPILER_VERSION}_dllmono wxMSW-2.8.12_gcc${MSYS2_COMPILER_VERSION}_dllmono_Dev/lib/

7za u wxMSW-2.8.12_gcc${MSYS2_COMPILER_VERSION}_dllmono_Dev.7z wxMSW-2.8.12_gcc${MSYS2_COMPILER_VERSION}_dllmono_Dev/

# echo "Finished"
