# This file is designed to be ran from (git for Windows) bash shell

# import local settings file
source local_settings.sh

cd $WXWIDGETS_REPO/../wxWidgets_3_1_branch || exit 1
# pwd

# Change to correct wxWidgets Git branch
# git lfs install
git restore include/wx/msw/setup.h
git checkout wxwidgets3.1.5_git || exit 2
# git pull
git submodule init
git submodule update
# git status -uno

export PATH=$MSYS2_COMPILER_X32_BASE/bin:$PATH

# echo $PATH

_COMPILER_VERSION="${MSYS2_COMPILER_VERSION}"

# echo $_COMPILER_VERSION

####
# Cleanup start
cd $WXWIDGETS_REPO/../wxWidgets_3_1_branch/build/msw || exit 3
mingw32-make -f makefile.gcc \
  CFG=mono \
  VENDOR=$_COMPILER_VERSION \
  COMPILER_VERSION=$_COMPILER_VERSION \
  CXXFLAGS=-std=gnu++11 \
  MONOLITHIC=1 SHARED=1 UNICODE=1 BUILD=release clean
mingw32-make -f makefile.gcc \
  CFG=mono \
  VENDOR=$_COMPILER_VERSION \
  COMPILER_VERSION=$_COMPILER_VERSION \
  CXXFLAGS=-std=gnu++11 \
  MONOLITHIC=1 SHARED=1 UNICODE=1 BUILD=debug  clean
#
# Cleanup Finish
####

sed --in-place "s/#define wxUSE_GRAPHICS_DIRECT2D 0/#define wxUSE_GRAPHICS_DIRECT2D 1/" $WXWIDGETS_REPO/../wxWidgets_3_1_branch/include/wx/msw/setup.h

## exit

cd $WXWIDGETS_REPO/../wxWidgets_3_1_branch/build/msw || exit 3
mingw32-make -f makefile.gcc \
  CFG=mono \
  VENDOR=$_COMPILER_VERSION \
  COMPILER_VERSION=$_COMPILER_VERSION \
  CXXFLAGS=-std=gnu++11 \
  MONOLITHIC=1 SHARED=1 UNICODE=1 BUILD=release

mingw32-make -f makefile.gcc \
  CFG=mono \
  VENDOR=$_COMPILER_VERSION \
  COMPILER_VERSION=$_COMPILER_VERSION \
  CXXFLAGS=-std=gnu++11 \
  MONOLITHIC=1 SHARED=1 UNICODE=1 BUILD=debug

# echo "Finished"
