# This file is designed to be ran from (git for Windows) bash shell

# import local settings file
source local_settings.sh

# Change to git folder
cd $WXWIDGETS_REPO || exit 1
# pwd

# Change to correct wxWidgets Git branch
# git lfs install
git checkout wxwidgets3.1.3_git || exit 2
# git status -uno

git submodule update
# git status -uno

export PATH=/C/GreenApps64/MinGW_cb20.03/bin:$PATH

# echo $PATH

# which g++

#cd $WXWIDGETS_REPO/build/msw || exit 3
#mingw32-make -f makefile.gcc \
  #CXXFLAGS+="-fno-keep-inline-dllexport -std=gnu++11" \
  #COMPILER_VERSION=810_x64 \
  #MONOLITHIC=0 SHARED=0 UNICODE=1 BUILD=release clean
#rm -f include/wx/msw/setup.h

cd $WXWIDGETS_REPO/build/msw || exit 3
mingw32-make -f makefile.gcc \
  CXXFLAGS+="-fno-keep-inline-dllexport -std=gnu++11" \
  COMPILER_VERSION=810_x64 \
  MONOLITHIC=0 SHARED=0 UNICODE=1 BUILD=release

cd $WXWIDGETS_REPO/samples/minimal || exit 4
mingw32-make -f makefile.gcc \
  CXXFLAGS+="-fno-keep-inline-dllexport -std=gnu++11" \
  COMPILER_VERSION=810_x64 \
  MONOLITHIC=0 SHARED=0 UNICODE=1 BUILD=release

cd $WXWIDGETS_REPO/samples/minimal || exit 4
mingw32-make -f makefile.gcc \
  CXXFLAGS+="-fno-keep-inline-dllexport -std=gnu++11" \
  COMPILER_VERSION=810_x64 \
  MONOLITHIC=0 SHARED=0 UNICODE=1 BUILD=release

# echo "Finished"
