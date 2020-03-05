# This file is designed to be ran from (git for Windows) bash shell

# import local settings file
source local_settings.sh

# Change to git folder
cd $WXWIDGETS_REPO || exit 1
# pwd

# Change to correct wxWidgets Git branch
# git lfs install
git checkout master || exit 2
git pull
git submodule init
git submodule update
# git status -uno


export PATH=/C/Apps64/NUWEN-GCC8.2/bin:$PATH

# echo $PATH

_COMPILER_VERSION=820W64x64

# echo $_COMPILER_VERSION

cd build/msw || exit 3

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

cd $WXWIDGETS_REPO/samples/minimal || exit 4
#
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
