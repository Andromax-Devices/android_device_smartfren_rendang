# Copyright (C) 2015-2017 The CyanogenMod Project
# Copyright (C) 2017, The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, device/smartfren/rendang/device.mk)
$(call inherit-product, vendor/ancient/config/common_full_phone.mk)

# Must define platform variant before including any common things
TARGET_BOARD_PLATFORM_VARIANT := msm8916

# Assert
TARGET_OTA_ASSERT_DEVICE := rendang,G36C1H,omni_rendang

WITH_GAPPS := true
TARGET_GAPPS_ARCH := arm
IS_PHONE := true

TARGET_VENDOR := Smartfren
PRODUCT_DEVICE := rendang
PRODUCT_NAME := ancient_rendang
BOARD_VENDOR := Smartfren
PRODUCT_BRAND := Smartfren
PRODUCT_MODEL := Andromax Q - G36C1H
PRODUCT_MANUFACTURER := Smartfren

# Device Identifiers
PRODUCT_BUILD_PROP_OVERRIDES += \
     PRODUCT_MODEL="Smartfren Andromax Q - G36C1H" \
     PRODUCT_NAME="rendang" \
     PRODUCT_DEVICE="rendang"

PRODUCT_PROPERTY_OVERRIDES += \
     ro.build.product=rendang

# Build fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="Kraft-A6000-user 5.0.2 LRX22G Kraft-A6000_S061_160727 release-keys"

BUILD_FINGERPRINT := Lenovo/Kraft-A6000/Kraft-A6000:5.0.2/LRX22G/Kraft-A6000_S061_160727:user/release-keys

# GMS
PRODUCT_GMS_CLIENTID_BASE := android-lenovo

# Trust
PRODUCT_PACKAGES += \
    vendor.lineage.trust@1.0-service

# APN(s)
PRODUCT_COPY_FILES += device/smartfren/rendang/apns-conf.xml:system/etc/apns-conf.xml
