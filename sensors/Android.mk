LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    sensors.cpp \
    SensorBase.cpp \
    LightSensor.cpp \
    ProximitySensor.cpp \
    CompassSensor.cpp \
    Accelerometer.cpp \
    Gyroscope.cpp \
    Bmp180.cpp \
    InputEventReader.cpp \
    CalibrationManager.cpp \
    NativeSensorManager.cpp \
    VirtualSensor.cpp \
    sensors_XML.cpp

LOCAL_CFLAGS += -DLOG_TAG=\"Sensors\"

LOCAL_C_INCLUDES := \
    external/libxml2/include \
    external/icu/icu4c/source/common

LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include
LOCAL_ADDITIONAL_DEPENDENCIES := $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr

LOCAL_SHARED_LIBRARIES := liblog libcutils libdl libxml2 libutils
LOCAL_HEADER_LIBRARIES := calibration_headers

LOCAL_MODULE := sensors.$(TARGET_DEVICE)
LOCAL_MODULE_TAGS := optional
LOCAL_VENDOR_MODULE := true

include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)

LOCAL_MODULE_SUFFIX := .a
LOCAL_MODULE := CompassAlgo
LOCAL_MODULE_CLASS := STATIC_LIBRARIES

ifdef TARGET_2ND_ARCH
LOCAL_SRC_FILES_32 := algo/memsic/CompassAlgo_32.a
LOCAL_SRC_FILES_64 := algo/memsic/CompassAlgo.a
LOCAL_MULTILIB := both
else
LOCAL_SRC_FILES := algo/memsic/CompassAlgo_32.a
endif
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libcalmodule_memsic
LOCAL_SRC_FILES := \
    algo/memsic/memsic_wrapper.c

LOCAL_STATIC_LIBRARIES := CompassAlgo
LOCAL_SHARED_LIBRARIES := liblog libcutils
LOCAL_MODULE_TAGS := optional

LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)

include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)

LOCAL_MODULE := calmodule.cfg
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR_ETC)
LOCAL_SRC_FILES := calmodule.cfg

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)

LOCAL_MODULE := sensors.$(TARGET_BOARD_PLATFORM)

LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_VENDOR_MODULE := true

LOCAL_CFLAGS := -Wall -Werror -DLOG_TAG=\"MultiHal\"

LOCAL_SRC_FILES := \
    multihal.cpp \
    SensorEventQueue.cpp \

LOCAL_SHARED_LIBRARIES := \
    libcutils \
    libdl \
    liblog \
    libutils \

LOCAL_STRIP_MODULE := false

include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := calibration_headers
LOCAL_EXPORT_C_INCLUDE := \
    CalibrationModule.h \
    sensors_extension.h \
    sensors.h
include $(BUILD_HEADER_LIBRARY)
