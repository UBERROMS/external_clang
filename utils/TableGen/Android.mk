LOCAL_PATH:= $(call my-dir)

clang_tablegen_SRC_FILES := \
  ClangASTNodesEmitter.cpp \
  ClangAttrEmitter.cpp \
  ClangCommentCommandInfoEmitter.cpp \
  ClangCommentHTMLNamedCharacterReferenceEmitter.cpp \
  ClangCommentHTMLTagsEmitter.cpp \
  ClangDiagnosticsEmitter.cpp \
  ClangSACheckersEmitter.cpp \
  NeonEmitter.cpp \
  TableGen.cpp

include $(CLEAR_VARS)

LOCAL_MODULE := clang-tblgen
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(clang_tablegen_SRC_FILES)

REQUIRES_EH := 1
REQUIRES_RTTI := 1

LOCAL_STATIC_LIBRARIES := \
  libLLVMTableGen \
  libLLVMSupport

LOCAL_LDLIBS += -lm
LOCAL_LDLIBS_windows := -limagehlp -lpsapi -lversion
LOCAL_LDLIBS_darwin := -lpthread -ldl
LOCAL_LDLIBS_linux := -lpthread -ldl

include $(LLVM_HOST_BUILD_MK)
include $(BUILD_HOST_EXECUTABLE)
