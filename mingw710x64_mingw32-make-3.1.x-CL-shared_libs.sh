# This file is designed to be ran from (git for Windows) bash shell

# import local settings file
source local_settings.sh

cd $WXWIDGETS_REPO || exit 1
# pwd

# Change to correct wxWidgets Git branch
# git lfs install
git restore include/wx/msw/setup.h
git checkout master || exit 2
git pull
git submodule init
git submodule update
# git status -uno

export PATH=/C/GreenApps64/x86_64-7.1.0-release-posix-seh-rt_v5-rev2/mingw64/bin:$PATH

# echo $PATH

_COMPILER_VERSION="710_x64"

####
# Cleanup start
cd $WXWIDGETS_REPO/build/msw || exit 3
mingw32-make -f makefile.gcc \
  COMPILER_VERSION=$_COMPILER_VERSION \
  VENDOR=cl \
  CPPFLAGS="-D__MINGW64_TOOLCHAIN__" \
  CXXFLAGS=-std=gnu++11 \
  MONOLITHIC=0 SHARED=1 UNICODE=1 BUILD=release clean && \
mingw32-make -f makefile.gcc \
  COMPILER_VERSION=$_COMPILER_VERSION \
  VENDOR=cl \
  CPPFLAGS="-D__MINGW64_TOOLCHAIN__" \
  CXXFLAGS=-std=gnu++11 \
  MONOLITHIC=0 SHARED=1 UNICODE=1 BUILD=debug  clean
#
# Cleanup Finish
####

sed --in-place "s/define wxUSE_GRAPHICS_DIRECT2D 0/define wxUSE_GRAPHICS_DIRECT2D 1/" $WXWIDGETS_REPO/include/wx/msw/setup.h
sed --in-place "s/define wxUSE_GRAPHICS_CONTEXT 0/define wxUSE_GRAPHICS_CONTEXT 1/" $WXWIDGETS_REPO/include/wx/msw/setup.h

cd $WXWIDGETS_REPO/build/msw || exit 3
mingw32-make -f makefile.gcc \
  COMPILER_VERSION=$_COMPILER_VERSION \
  VENDOR=cl \
  CPPFLAGS="-D__MINGW64_TOOLCHAIN__" \
  CXXFLAGS=-std=gnu++11 \
  MONOLITHIC=0 SHARED=1 UNICODE=1 BUILD=release build_cfg_file && \
mingw32-make -f makefile.gcc \
  COMPILER_VERSION=$_COMPILER_VERSION \
  VENDOR=cl \
  CPPFLAGS="-D__MINGW64_TOOLCHAIN__" \
  CXXFLAGS=-std=gnu++11 \
  MONOLITHIC=0 SHARED=1 UNICODE=1 BUILD=debug build_cfg_file

## exit

cd $WXWIDGETS_REPO/build/msw || exit 3
mingw32-make -f makefile.gcc \
  COMPILER_VERSION=$_COMPILER_VERSION \
  VENDOR=cl \
  CPPFLAGS="-D__MINGW64_TOOLCHAIN__" \
  CXXFLAGS=-std=gnu++11 \
  MONOLITHIC=0 SHARED=1 UNICODE=1 BUILD=release && \
mingw32-make -f makefile.gcc \
  COMPILER_VERSION=$_COMPILER_VERSION \
  VENDOR=cl \
  CPPFLAGS="-D__MINGW64_TOOLCHAIN__" \
  CXXFLAGS=-std=gnu++11 \
  MONOLITHIC=0 SHARED=1 UNICODE=1 BUILD=debug

# echo "Finished"
