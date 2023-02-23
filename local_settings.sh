# local user settings

# MINGW_ORG_COMPILER_BASE
#    can not have a colon ":" in it.
MINGW_ORG_COMPILER_BASE="/C/MinGW.org"
MINGW_ORG_COMPILER_VERSION="920M32"

# MSYS2_BASE
#    can not have a colon ":" in it.
if [[ $PROCESSOR_ARCHITECTURE == "x86" ]]; then
  MSYS2_BASE="/H/msys32"
else
  MSYS2_BASE="/H/msys64"
fi
MSYS2_COMPILER_X64_BASE="$MSYS2_BASE/mingw64"
MSYS2_COMPILER_X32_BASE="$MSYS2_BASE/mingw32"
MSYS2_COMPILER_VERSION="1220"
MSYS2_CLANG_VERSION="1507CLANG"

WXWIDGETS_REPO="H:/repos/git/devel/wxwidgets_libs/wxWidgets"

WXWIDGETS_3_0_REPO="H:/devel/wxwidgets_libs/repos/wxWidgets_3_0_branch"
WXWIDGETS_3_0_TEST_BRANCH="testing3.0"
WXWIDGETS_3_0_PROD_BRANCH="wxwidgets3.0.5_git"

WXWIDGETS_2_8_REPO="H:/devel/wxwidgets_libs/repos/wxWidgets_2_8_branch"
WXWIDGETS_2_8_PROD_BRANCH="wxwidgets2.8.12_git"

WXWIDGETS_3_2_REPO="H:/devel/wxwidgets_libs/repos/wxWidgets_3_2_branch"
WXWIDGETS_3_2_PROD_BRANCH="wxwidgets3.2.0_git"
