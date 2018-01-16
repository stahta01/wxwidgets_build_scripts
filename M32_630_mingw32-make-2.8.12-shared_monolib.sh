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


export PATH=$MINGW_ORG_COMPILER_BASE/bin:$PATH

# echo $PATH

cp include/wx/msw/setup0.h include/wx/msw/setup.h
    sed --in-place "s/#define WXWIN_COMPATIBILITY_2_6 1/#define WXWIN_COMPATIBILITY_2_6 0/" include/wx/msw/setup.h

_COMPILER_VERSION=$MINGW_ORG_COMPILER_VERSION

# echo $_COMPILER_VERSION

cd build/msw || exit 3

mingw32-make -f makefile.gcc \
  CFG=mono \
  VENDOR=$_COMPILER_VERSION \
  COMPILER_VERSION=$_COMPILER_VERSION \
  CPPFLAGS="-D_WIN32_IE=0x0603 -D_WIN32_WINNT=0x502" \
  USE_OPENGL=1 \
  MONOLITHIC=1 SHARED=1 UNICODE=1 BUILD=debug

mingw32-make -f makefile.gcc \
  CFG=mono \
  VENDOR=$_COMPILER_VERSION \
  COMPILER_VERSION=$_COMPILER_VERSION \
  CPPFLAGS="-D_WIN32_IE=0x0603 -D_WIN32_WINNT=0x502" \
  USE_OPENGL=1 \
  MONOLITHIC=1 SHARED=1 UNICODE=1 BUILD=release

# echo "Finished"
