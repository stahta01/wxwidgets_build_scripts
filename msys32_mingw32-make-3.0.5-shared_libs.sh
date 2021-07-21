# This file is designed to be ran from (git for Windows) bash shell

# import local settings file
source local_settings.sh

cd $WXWIDGETS_3_0_REPO || exit 1
# pwd

# Change to correct wxWidgets Git branch
# git lfs install
git restore include/wx/msw/setup0.h && \
git checkout wxwidgets3.0.5_git || exit 2
# git status -uno

export PATH=$MSYS2_COMPILER_X32_BASE/bin:$PATH

# echo $PATH

_COMPILER_VERSION="${MSYS2_COMPILER_VERSION}"

# echo $_COMPILER_VERSION

####
# Cleanup start
cd $WXWIDGETS_3_0_REPO/build/msw || exit 3
mingw32-make -f makefile.gcc \
  VENDOR=$_COMPILER_VERSION \
  COMPILER_VERSION=$_COMPILER_VERSION \
  MONOLITHIC=0 SHARED=1 UNICODE=1 BUILD=release clean
mingw32-make -f makefile.gcc \
  VENDOR=$_COMPILER_VERSION \
  COMPILER_VERSION=$_COMPILER_VERSION \
  MONOLITHIC=0 SHARED=1 UNICODE=1 BUILD=debug  clean
#
# Cleanup Finish
####

cp -f $WXWIDGETS_3_0_REPO/include/wx/msw/setup0.h $WXWIDGETS_3_0_REPO/include/wx/msw/setup.h

sed --in-place "s/define wxUSE_GRAPHICS_DIRECT2D 0/define wxUSE_GRAPHICS_DIRECT2D 1/" $WXWIDGETS_3_0_REPO/include/wx/msw/setup.h
sed --in-place "s/define wxUSE_GRAPHICS_CONTEXT 0/define wxUSE_GRAPHICS_CONTEXT 1/" $WXWIDGETS_3_0_REPO/include/wx/msw/setup.h

## exit

cd $WXWIDGETS_3_0_REPO/build/msw || exit 3
mingw32-make -f makefile.gcc \
  VENDOR=$_COMPILER_VERSION \
  COMPILER_VERSION=$_COMPILER_VERSION \
  CPPFLAGS="-D__MINGW64_TOOLCHAIN__" \
  CXXFLAGS="-std=gnu++11 -fpermissive -Wno-deprecated-copy" \
  MONOLITHIC=0 SHARED=1 UNICODE=1 BUILD=release && \
mingw32-make -f makefile.gcc \
  VENDOR=$_COMPILER_VERSION \
  COMPILER_VERSION=$_COMPILER_VERSION \
  CPPFLAGS="-D__MINGW64_TOOLCHAIN__" \
  CXXFLAGS="-std=gnu++11 -fpermissive -Wno-deprecated-copy" \
  MONOLITHIC=0 SHARED=1 UNICODE=1 BUILD=debug

# echo "Finished"
