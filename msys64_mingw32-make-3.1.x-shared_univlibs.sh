# This file is designed to be ran from (git for Windows) bash shell

# import local settings file
source local_settings.sh

cd $WXWIDGETS_REPO || exit 1
# pwd

# Change to correct wxWidgets Git branch
# git lfs install
git checkout master || exit 2
git pull
git submodule init
git submodule update
git checkout temp && git rebase master
# git status -uno

export PATH=$MSYS2_COMPILER_X64_BASE/bin:$PATH

# echo $PATH

_COMPILER_VERSION="${MSYS2_COMPILER_VERSION}_x64"

# echo $_COMPILER_VERSION

####
# Cleanup start
cd $WXWIDGETS_REPO/build/msw || exit 3
mingw32-make -f makefile.gcc \
  CFG=univ \
  VENDOR=$_COMPILER_VERSION \
  COMPILER_VERSION=$_COMPILER_VERSION \
  CXXFLAGS=-std=gnu++11 \
  WXUNIV=1 MONOLITHIC=0 SHARED=1 UNICODE=1 BUILD=release clean
mingw32-make -f makefile.gcc \
  CFG=univ \
  VENDOR=$_COMPILER_VERSION \
  COMPILER_VERSION=$_COMPILER_VERSION \
  CXXFLAGS=-std=gnu++11 \
  WXUNIV=1 MONOLITHIC=0 SHARED=1 UNICODE=1 BUILD=debug  clean
#
# Cleanup Finish
####

## exit

cd $WXWIDGETS_REPO/build/msw || exit 3
mingw32-make -f makefile.gcc \
  CFG=univ \
  VENDOR=$_COMPILER_VERSION \
  COMPILER_VERSION=$_COMPILER_VERSION \
  CXXFLAGS=-std=gnu++11 \
  WXUNIV=1 MONOLITHIC=0 SHARED=1 UNICODE=1 BUILD=release && \
mingw32-make -f makefile.gcc \
  CFG=univ \
  VENDOR=$_COMPILER_VERSION \
  COMPILER_VERSION=$_COMPILER_VERSION \
  CXXFLAGS=-std=gnu++11 \
  WXUNIV=1 MONOLITHIC=0 SHARED=1 UNICODE=1 BUILD=debug

# echo "Finished"
