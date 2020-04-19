# This file is designed to be ran from (git for Windows) bash shell

# import local settings file
source local_settings.sh

cd $WXWIDGETS_3_0_REPO || exit 1
# pwd

# Change to correct wxWidgets Git branch
# git lfs install
git checkout $WXWIDGETS_3_0_LFS_BRANCH || exit 2
git pull
# git status -uno

export PATH=$MSYS2_COMPILER_X64_BASE/bin:$PATH

# echo $PATH

_COMPILER_VERSION="${MSYS2_COMPILER_VERSION}_x64"

# echo $_COMPILER_VERSION

cd $WXWIDGETS_3_0_REPO/build/msw || exit 3
mingw32-make -f makefile.gcc \
  VENDOR=$_COMPILER_VERSION \
  COMPILER_VERSION=$_COMPILER_VERSION \
  CXXFLAGS=-std=gnu++11 \
  MONOLITHIC=0 SHARED=1 UNICODE=1 BUILD=release clean
rm -f $WXWIDGETS_3_0_REPO/include/wx/msw/setup.h

cd $WXWIDGETS_3_0_REPO/build/msw || exit 3
mingw32-make -f makefile.gcc \
  VENDOR=$_COMPILER_VERSION \
  COMPILER_VERSION=$_COMPILER_VERSION \
  CXXFLAGS=-std=gnu++11 \
  MONOLITHIC=0 SHARED=1 UNICODE=1 BUILD=release

mingw32-make -f makefile.gcc \
  VENDOR=$_COMPILER_VERSION \
  COMPILER_VERSION=$_COMPILER_VERSION \
  CXXFLAGS=-std=gnu++11 \
  MONOLITHIC=0 SHARED=1 UNICODE=1 BUILD=debug

# echo "Finished"
