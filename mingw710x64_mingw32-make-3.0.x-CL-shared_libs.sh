# This file is designed to be ran from (git for Windows) bash shell

# import local settings file
source local_settings.sh

# Change to git folder
cd $WXWIDGETS_3_0_REPO || exit 1
pwd


# Change to correct wxWidgets Git branch
# git lfs install
git restore include/wx/msw/setup0.h && \
git checkout WX_3_0_BRANCH || exit 2
# git status -uno

export PATH=/C/GreenApps64/x86_64-7.1.0-release-posix-seh-rt_v5-rev2/mingw64/bin:$PATH

# echo $PATH

####
# Cleanup start
cd $WXWIDGETS_3_0_REPO/build/msw || exit 3
mingw32-make -f makefile.gcc \
  VENDOR=cl \
  CPPFLAGS="-D__MINGW64_TOOLCHAIN__" \
  CXXFLAGS+="-fno-keep-inline-dllexport -std=gnu++11" \
  MONOLITHIC=0 SHARED=1 UNICODE=1 BUILD=release clean && \
mingw32-make -f makefile.gcc \
  VENDOR=cl \
  CPPFLAGS="-D__MINGW64_TOOLCHAIN__" \
  CXXFLAGS+="-fno-keep-inline-dllexport -std=gnu++11" \
  MONOLITHIC=0 SHARED=1 UNICODE=1 BUILD=debug  clean

#
# Cleanup Finish
####

sed --in-place "s/define wxUSE_GRAPHICS_DIRECT2D 0/define wxUSE_GRAPHICS_DIRECT2D 1/" $WXWIDGETS_3_0_REPO/include/wx/msw/setup0.h
sed --in-place "s/define wxUSE_GRAPHICS_CONTEXT 0/define wxUSE_GRAPHICS_CONTEXT 1/" $WXWIDGETS_3_0_REPO/include/wx/msw/setup0.h

cp -f $WXWIDGETS_3_0_REPO/include/wx/msw/setup0.h $WXWIDGETS_3_0_REPO/include/wx/msw/setup.h

## exit

cd $WXWIDGETS_3_0_REPO/build/msw || exit 3
mingw32-make -f makefile.gcc \
  VENDOR=cl \
  CPPFLAGS="-D__MINGW64_TOOLCHAIN__" \
  CXXFLAGS+="-fno-keep-inline-dllexport -std=gnu++11" \
  MONOLITHIC=0 SHARED=1 UNICODE=1 BUILD=release

mingw32-make -f makefile.gcc \
  VENDOR=cl \
  CPPFLAGS="-D__MINGW64_TOOLCHAIN__" \
  CXXFLAGS+="-fno-keep-inline-dllexport -std=gnu++11" \
  MONOLITHIC=0 SHARED=1 UNICODE=1 BUILD=debug

# echo "Finished"
