# This file is designed to be ran from (git for Windows) bash shell

# import local settings file
source local_settings.sh

# Change to git folder
cd $WXWIDGETS_3_1_REPO || exit 1
# pwd

# Change to correct wxWidgets Git branch
# git lfs install
git checkout $WXWIDGETS_3_1_LFS_BRANCH  || exit 2
# git status -uno

export PATH=$MSYS2_COMPILER_X64_BASE/bin:$PATH

# echo $PATH


# echo $MSYS2_COMPILER_VERSION

cd build/msw || exit 3

mingw32-make -f makefile.gcc \
  CFG= \
  VENDOR=$MSYS2_COMPILER_VERSION \
  COMPILER_VERSION=$MSYS2_COMPILER_VERSION \
  CXXFLAGS=-std=gnu++11 \
  LDFLAGS=-Wl,--allow-multiple-definition \
  MONOLITHIC=0 SHARED=1 UNICODE=1 BUILD=release

mingw32-make -f makefile.gcc \
  CFG= \
  VENDOR=$MSYS2_COMPILER_VERSION \
  COMPILER_VERSION=$MSYS2_COMPILER_VERSION \
  CXXFLAGS=-std=gnu++11 \
  LDFLAGS=-Wl,--allow-multiple-definition \
  MONOLITHIC=0 SHARED=1 UNICODE=1 BUILD=debug

echo "Finished"
