#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

FORCE_32_BIT := true

# Inherit from msm8916-common
include device/cyanogen/msm8916-common/BoardConfigCommon.mk

DEVICE_PATH := device/smartfren/rendang

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8916_X6_6171E

# Camera
BOARD_CAMERA_SENSORS := \
    ov5670_q5v41b \
    ov5648_q5v22e_rendang \
    gc2355_rendang

TARGET_USES_AOSP := true

TARGET_PROCESS_SDK_VERSION_OVERRIDE := \
    /system/bin/cameraserver=22 \
    /system/bin/mediaserver=22 \
    /vendor/bin/mm-qcamera-daemon=22

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_DISABLE_INIT_BLANK := true
BACKLIGHT_PATH := /sys/class/leds/lcd-backlight/brightness

# Dexpreopt
ifeq ($(HOST_OS),linux)
  ifneq ($(TARGET_BUILD_VARIANT),eng)
    WITH_DEXPREOPT ?= true
  endif
endif
WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY ?= true

# Extended filesystem support
TARGET_EXFAT_DRIVER := exfat

# Filesystem
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_CACHEIMAGE_PARTITION_SIZE := 335544320
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1073741824
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5939100672
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_PARTITION_SIZE      := 67108864
BOARD_VENDORIMAGE_EXTFS_INODE_COUNT   := 4096
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE    := squashfs
BOARD_VENDORIMAGE_JOURNAL_SIZE        := 0
BOARD_VENDORIMAGE_SQUASHFS_COMPRESSOR := lz4
PRODUCT_VENDOR_MOVE_ENABLED := true
TARGET_COPY_OUT_VENDOR := vendor
TARGET_FS_CONFIG_GEN := $(DEVICE_PATH)/config.fs

# GPS
TARGET_NO_RPC := true

# Kernel
BOARD_DTBTOOL_ARGS := -2
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_KERNEL_SEPARATED_DT := true
TARGET_KERNEL_CONFIG := lineageos_rendang_defconfig
BOARD_KERNEL_CMDLINE += phy-msm-usb.floated_charger_enable=1

# Power
TARGET_HAS_NO_POWER_STATS := true

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom
BOARD_NO_SECURE_DISCARD := true

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)/releasetools

# SELinux
BOARD_SEPOLICY_DIRS += \
    $(DEVICE_PATH)/sepolicy

# Shims
TARGET_LD_SHIM_LIBS += \
    /vendor/lib/libmmcamera2_imglib_modules.so|libshim_camera.so

# inherit from the proprietary version
include vendor/smartfren/rendang/BoardConfigVendor.mk
