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


export PATH=$COMPILER_640TDM_BASE/bin:$PATH

# echo $PATH

# echo $MSYS2_COMPILER_VERSION

cd build/msw || exit 3

mingw32-make -f makefile.gcc \
  COMPILER_VERSION=$MSYS2_COMPILER_VERSION \
  CXXFLAGS=-std=gnu++11 \
  MONOLITHIC=0 SHARED=0 UNICODE=1 BUILD=debug

mingw32-make -f makefile.gcc \
  COMPILER_VERSION=$MSYS2_COMPILER_VERSION \
  CXXFLAGS=-std=gnu++11 \
  MONOLITHIC=0 SHARED=0 UNICODE=1 BUILD=release

# echo "Finished"
