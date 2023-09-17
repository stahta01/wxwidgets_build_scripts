# This file is designed to be ran from (git for Windows) bash shell

# import local settings file
source local_settings.sh

cd $WXWIDGETS_3_2_REPO || exit 1
# pwd

# Change to correct wxWidgets Git branch
# git lfs install
git restore include/wx/msw/setup.h
git checkout wxwidgets3.2.2_git || exit 2
# git pull
git submodule init
git submodule update
# git status -uno

export PATH=/C/GreenApps/winlibs-x86_64-posix-seh-gcc-13.1.0-mingw-w64ucrt-11.0.0-r5/mingw64/bin:$PATH

echo $PATH

_COMPILER_VERSION="13.1.0_x64"

# echo $_COMPILER_VERSION

#####
## Cleanup start
cd $WXWIDGETS_3_2_REPO/build/msw || exit 3
mingw32-make -f makefile.gcc \
  CFG=cb \
  CXXFLAGS=-std=gnu++11 \
  COMPILER_VERSION=$_COMPILER_VERSION \
  MONOLITHIC=1 SHARED=1 UNICODE=1 BUILD=release clean
mingw32-make -f makefile.gcc \
  CFG=cb \
  CXXFLAGS=-std=gnu++11 \
  COMPILER_VERSION=$_COMPILER_VERSION \
  MONOLITHIC=1 SHARED=1 UNICODE=1 BUILD=debug clean
##
## Cleanup Finish
#####

sed --in-place "s/#define wxUSE_GRAPHICS_DIRECT2D 0/#define wxUSE_GRAPHICS_DIRECT2D 1/" $WXWIDGETS_3_2_REPO/include/wx/msw/setup.h

## exit

cd $WXWIDGETS_3_2_REPO/build/msw || exit 3
mingw32-make -f makefile.gcc \
  CFG=cb \
  VENDOR=cb \
  CXXFLAGS=-std=gnu++11 \
  COMPILER_VERSION=$_COMPILER_VERSION \
  MONOLITHIC=1 SHARED=1 UNICODE=1 BUILD=release

cd $WXWIDGETS_3_2_REPO/samples || exit 4
mingw32-make -f makefile.gcc \
  CFG=cb \
  CXXFLAGS=-std=gnu++11 \
  COMPILER_VERSION=$_COMPILER_VERSION \
  CXXFLAGS=-std=gnu++11 \
  MONOLITHIC=1 SHARED=1 UNICODE=1 BUILD=release

cd $WXWIDGETS_3_2_REPO/build/msw || exit 3
mingw32-make -f makefile.gcc \
  CFG=cb \
  CXXFLAGS=-std=gnu++11 \
  COMPILER_VERSION=$_COMPILER_VERSION \
  MONOLITHIC=1 SHARED=1 UNICODE=1 BUILD=debug

# echo "Finished"