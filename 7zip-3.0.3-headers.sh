# This file is designed to be ran from (git for Windows) bash shell

# import local settings file
source local_settings.sh

# Change to git folder
cd $WXWIDGETS_3_0_REPO || exit 1
# pwd

# Change to correct wxWidgets Git branch
# git lfs install
git checkout $WXWIDGETS_3_0_LFS_BRANCH || exit 2
# git status -uno


mkdir -p wxWidgets-3.0.3_headers
cp --recursive --update --preserve include wxWidgets-3.0.3_headers/
rm -f wxWidgets-3.0.3_headers/include/wx/msw/setup.h

7za u wxWidgets-3.0.3_headers.7z wxWidgets-3.0.3_headers\

# echo "Finished"
