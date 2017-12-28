# This file is designed to be ran from (git for Windows) bash shell

# import local settings file
source local_settings.sh

# Change to git folder
cd $WXWIDGETS_3_0_REPO || exit 1
# pwd

# Change to correct wxWidgets Git branch
git checkout $WXWIDGETS_3_0_TEST_BRANCH || exit 2


export PATH=$COMPILER_640TDM_BASE/bin:$PATH

# echo $PATH

_COMPILER_VERSION=640TDM

# echo $_COMPILER_VERSION

cd build/msw || exit 3


# There seems to be a length limit on CFG value when doing 
# monolithic DLL builds; 14 charactors seems to be too long.
# The symtom is the DLL is not created because of an linking error
mingw32-make -f makefile.gcc \
  CFG=mtst \
  VENDOR=$_COMPILER_VERSION \
  COMPILER_VERSION=$_COMPILER_VERSION \
  CXXFLAGS=-std=gnu++11 \
  MONOLITHIC=1 SHARED=1 UNICODE=1 BUILD=debug

mingw32-make -f makefile.gcc \
  CFG=mtst \
  VENDOR=$_COMPILER_VERSION \
  COMPILER_VERSION=$_COMPILER_VERSION \
  CXXFLAGS=-std=gnu++11 \
  MONOLITHIC=1 SHARED=1 UNICODE=1 BUILD=release

# echo "Finished"
