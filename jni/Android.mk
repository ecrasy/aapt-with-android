# 
# Copyright 2006 The Android Open Source Project
#
# Android Asset Packaging Tool
#

# This tool is prebuilt if we're doing an app-only build.
ifeq ($(TARGET_BUILD_APPS),)

LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_C_INCLUDES += expat
LOCAL_C_INCLUDES += png
LOCAL_C_INCLUDES += zlib
LOCAL_CFLAGS += -Wno-format-y2k -DHAVE_OFF64_T -DHAVE_ENDIAN_H -DHAVE_PTHREADS -DHAVE_MEMMOVE

LOCAL_MODULE := libexpat
LOCAL_ARM_MODE := arm
LOCAL_SRC_FILES :=\
    ./expat/xmlparse.c \
	./expat/xmlrole.c	\
    ./expat/xmltok_ns.c	\
	./expat/xmltok.c	\
	./expat/xmltok_impl.c
include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_C_INCLUDES += expat
LOCAL_C_INCLUDES += png
LOCAL_C_INCLUDES += zlib
LOCAL_CFLAGS += -Wno-format-y2k -DHAVE_OFF64_T -DHAVE_ENDIAN_H -DHAVE_PTHREADS -DHAVE_MEMMOVE

LOCAL_MODULE := libpng
LOCAL_ARM_MODE := arm
LOCAL_SRC_FILES :=\
	./png/png.c \
	./png/pngerror.c \
    ./png/pnggccrd.c \
	./png/pngget.c \
	./png/pngmem.c \
	./png/pngpread.c \
	./png/pngread.c \
    ./png/pngrio.c \
	./png/pngrtran.c \
	./png/pngrutil.c \
	./png/pngset.c \
	./png/pngtrans.c \
    ./png/pngvcrd.c \
	./png/pngwio.c \
	./png/pngwrite.c \
	./png/pngwtran.c \
    ./png/pngwutil.c
include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)

LOCAL_C_INCLUDES += expat
LOCAL_C_INCLUDES += png
LOCAL_C_INCLUDES += zlib
LOCAL_CFLAGS += -Wno-format-y2k -DHAVE_OFF64_T -DHAVE_ENDIAN_H -DHAVE_PTHREADS -DHAVE_POSIX_FILEMAP

LOCAL_SRC_FILES := \
	AaptAssets.cpp \
	Command.cpp \
	CrunchCache.cpp \
	FileFinder.cpp \
    Main.cpp \
	Package.cpp \
	StringPool.cpp \
	XMLNode.cpp \
	ResourceFilter.cpp \
    ResourceTable.cpp \
	Images.cpp \
	Resource.cpp \
    SourcePos.cpp \
    ZipEntry.cpp \
    ZipFile.cpp \
    ./utils-cpp/Asset.cpp \
	./utils-cpp/AssetDir.cpp \
	./utils-cpp/AssetManager.cpp \
	./utils-cpp/BlobCache.cpp \
	./utils-cpp/BufferedTextOutput.cpp \
	./utils-cpp/CallStack.cpp \
	./utils-cpp/Debug.cpp \
	./utils-cpp/FileMap.cpp \
	./utils-cpp/Flattenable.cpp \
	./utils-cpp/LinearTransform.cpp \
	./utils-cpp/ObbFile.cpp \
	./utils-cpp/PropertyMap.cpp \
	./utils-cpp/RefBase.cpp \
	./utils-cpp/ResourceTypes.cpp \
	./utils-cpp/SharedBuffer.cpp \
	./utils-cpp/Static.cpp \
	./utils-cpp/StopWatch.cpp \
	./utils-cpp/StreamingZipInflater.cpp \
	./utils-cpp/String8.cpp \
	./utils-cpp/String16.cpp \
	./utils-cpp/StringArray.cpp \
	./utils-cpp/SystemClock.cpp \
	./utils-cpp/TextOutput.cpp \
	./utils-cpp/Threads.cpp \
	./utils-cpp/Timers.cpp \
	./utils-cpp/Tokenizer.cpp \
	./utils-cpp/Unicode.cpp \
	./utils-cpp/VectorImpl.cpp \
	./utils-cpp/ZipFileCRO.cpp \
	./utils-cpp/ZipFileRO.cpp \
	./utils-cpp/ZipUtils.cpp \
	./utils-cpp/misc.cpp \
	./cutils-c/atomic.c \
	./cutils-c/properties.c	\
	./cutils-c/sched_policy.c	\
	./cutils-c/sockets.c	\
	./cutils-c/threads.c	\
	./cutils-c/uio.c	\
    ./host/pseudolocalize.cpp

LOCAL_STATIC_LIBRARIES := \
    libc \
	libutils \
	libcutils \
	libexpat \
	libpng

LOCAL_LDFLAGS += -pthread

# Statically link libz for MinGW (Win SDK under Linux),
# and dynamically link for all others.
ifneq ($(strip $(USE_MINGW)),)
  LOCAL_STATIC_LIBRARIES += libz
else
  LOCAL_LDLIBS += -lz
endif

LOCAL_MODULE := aapt
LOCAL_ARM_MODE := arm

include $(BUILD_EXECUTABLE)

endif # TARGET_BUILD_APPS
