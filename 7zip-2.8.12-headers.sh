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


mkdir -p wxWidgets-2.8.12_headers
cp --recursive --update --preserve include wxWidgets-2.8.12_headers/
rm -f wxWidgets-2.8.12_headers/include/wx/msw/setup.h

7za u wxWidgets-2.8.12_headers.7z wxWidgets-2.8.12_headers\

# echo "Finished"
