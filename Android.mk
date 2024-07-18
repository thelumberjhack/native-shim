LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
  shim.c vm.c
LOCAL_C_INCLUDE := ${ANDROID_NDK_ROOT}/platforms/android-21/arch-arm/usr/include/

LOCAL_MODULE := shim
LOCAL_MODULE_TAGS := optional

# Allow execution on android-16
LOCAL_CFLAGS += -pie -fPIE
LOCAL_LDFLAGS += -pie -fPIE -Wl,--export-dynamic

ifeq ($(NDK_DEBUG),1)
  LOCAL_STRIP_MODE := none
endif

include $(BUILD_STATIC_EXECUTABLE)

include $(BUILD_EXECUTABLE)

include $(call all-makefiles-under,$(LOCAL_PATH))
