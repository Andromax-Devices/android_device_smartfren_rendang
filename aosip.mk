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
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
$(call inherit-product, device/smartfren/rendang/device.mk)

# Inherit Aosip specific configuration
$(call inherit-product, $(TOPDIR)vendor/aosip/config/common_full_phone.mk)

# Must define platform variant before including any common things
TARGET_BOARD_PLATFORM_VARIANT := msm8916

# Assert
TARGET_OTA_ASSERT_DEVICE := Andromax Q, rendang, Rendang, g36c1h, G36C1H, omni_rendang

TARGET_VENDOR := Smartfren
PRODUCT_DEVICE := rendang
PRODUCT_NAME := aosip_rendang
BOARD_VENDOR := Smartfren
PRODUCT_BRAND := Smartfren
PRODUCT_MODEL := Andromax Q - G36C1H
PRODUCT_MANUFACTURER := Smartfren

# Build fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="msm8939_x6_6171e_32-user 5.1.1 LMY47V eng.root.20160826 test-keys"

BUILD_FINGERPRINT := Smartfren/G36C1H/G36C1H:5.1.1/LMY48B/YOG4PAS42M:user/release-keys
