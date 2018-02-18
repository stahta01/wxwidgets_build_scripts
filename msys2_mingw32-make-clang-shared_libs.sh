# This file is designed to be ran from (git for Windows) bash shell

# import local settings file
source local_settings.sh

# Change to git folder
cd $WXWIDGETS_REPO || exit 1
# pwd

# Change to correct wxWidgets Git branch
# git lfs install
git checkout clang/makefile.gcc || exit 2
# git status -uno


export PATH=$MSYS2_COMPILER_BASE/bin:$PATH

# echo $PATH

# echo $MSYS2_COMPILER_VERSION

cd build/msw || exit 3

mingw32-make -f makefile.gcc \
  CC=clang CXX=clang++ \
  COMPILER_VERSION=$MSYS2_CLANG_VERSION \
  LDFLAGS="-Wl,--allow-multiple-definition"\
  MONOLITHIC=0 SHARED=1 UNICODE=1 BUILD=debug

mingw32-make -f makefile.gcc \
  CC=clang CXX=clang++ \
  COMPILER_VERSION=$MSYS2_CLANG_VERSION \
  LDFLAGS="-Wl,--allow-multiple-definition"\
  MONOLITHIC=0 SHARED=1 UNICODE=1 BUILD=release

# echo "Finished"
