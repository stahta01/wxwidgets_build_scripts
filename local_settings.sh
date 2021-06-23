# local user settings

# MINGW_ORG_COMPILER_BASE
#    can not have a colon ":" in it.
MINGW_ORG_COMPILER_BASE="/C/MinGW.org"
MINGW_ORG_COMPILER_VERSION="920M32"

# MSYS2_BASE
#    can not have a colon ":" in it.
if [[ $PROCESSOR_ARCHITECTURE == "x86" ]]; then
  MSYS2_BASE="/C/msys32"
else
  MSYS2_BASE="/C/msys64"
fi
MSYS2_COMPILER_X64_BASE="$MSYS2_BASE/mingw64"
MSYS2_COMPILER_X32_BASE="$MSYS2_BASE/mingw32"
MSYS2_COMPILER_VERSION="1030MSYS2"
MSYS2_CLANG_VERSION="501CLANG"

WXWIDGETS_REPO="$HOMEDRIVE/repos/git/wxWidgets"

WXWIDGETS_3_0_REPO="$HOMEDRIVE/repos/git/wxWidgets_3_0_branch"
WXWIDGETS_3_0_TEST_BRANCH="testing3.0"
WXWIDGETS_3_0_LFS_BRANCH="wxwidgets3.0.4_git-lfs"

WXWIDGETS_2_8_REPO="$HOMEDRIVE/repos/git/wxWidgets_2_8_branch"
WXWIDGETS_2_8_LFS_BRANCH="wxwidgets2.8.12_git-lfs"

WXWIDGETS_3_1_REPO="$HOMEDRIVE/Users/$USERNAME/devel/open_source_code/version_control/git_repos/wxWidgets"
WXWIDGETS_3_1_LFS_BRANCH="wxwidgets3.1.2_git-lfs"
