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


export PATH=$MSYS2_COMPILER_X32_BASE/bin:$PATH

# echo $PATH

# cp include/wx/msw/setup0.h include/wx/msw/setup.h
#    sed --in-place "s/#define WXWIN_COMPATIBILITY_2_6 1/#define WXWIN_COMPATIBILITY_2_6 0/" include/wx/msw/setup.h


echo $MSYS2_COMPILER_X32_VERSION

cd build/msw || exit 3

mingw32-make -f makefile.gcc \
  CFG=mono \
  VENDOR=$MSYS2_COMPILER_X32_VERSION \
  COMPILER_VERSION=$MSYS2_COMPILER_X32_VERSION \
  CXXFLAGS=-std=gnu++11 \
  USE_OPENGL=1 \
  MONOLITHIC=1 SHARED=1 UNICODE=1 BUILD=release

mingw32-make -f makefile.gcc \
  CFG=mono \
  VENDOR=$MSYS2_COMPILER_X32_VERSION \
  COMPILER_VERSION=$MSYS2_COMPILER_X32_VERSION \
  CXXFLAGS=-std=gnu++11 \
  USE_OPENGL=1 \
  MONOLITHIC=1 SHARED=1 UNICODE=1 BUILD=debug

# echo "Finished"
