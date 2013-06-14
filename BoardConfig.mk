#
# Copyright (C) 2012 The Android Open Source Project
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
#

#----------------------------------------------------------------------

# inherit from the proprietary version
-include vendor/pantech/ef40s/BoardConfigVendor.mk

# Headers path
TARGET_SPECIFIC_HEADER_PATH := device/pantech/ef40s/include

# inherit from pantech msm8660-common
-include device/pantech/msm8660-common/BoardConfigCommon.mk

#----------------------------------------------------------------------

# Assert
TARGET_OTA_ASSERT_DEVICE := IM-A810S,ef40s

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
#TARGET_CUSTOM_BLUEDROID := ../../../device/pantech/ef40s/bluetooth/bluetooth.c

# Board info
BOARD_HAS_NO_SELECT_BUTTON := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := ef40s

# Camera
BOARD_CAMERA_USE_MM_HEAP := true
BOARD_NEEDS_MEMORYHEAPPMEM := true
COMMON_GLOBAL_CFLAGS += -DICS_CAMERA_BLOB

# Disable PIE since it breaks ICS camera blobs
TARGET_DISABLE_ARM_PIE := true

# File system
BOARD_BOOTIMAGE_PARTITION_SIZE     := 10485760
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10485760
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 629145600
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1073741824
BOARD_FLASH_BLOCK_SIZE             := 131072

# HDMI
TARGET_QCOM_HDMI_OUT:= false

# Kernel
BOARD_KERNEL_BASE               := 0x40200000
BOARD_KERNEL_CMDLINE            := console=ttyHSL0,115200,n8 androidboot.hardware=qcom loglevel=0 androidboot.emmc=true androidboot.serialno=beb84f1b androidboot.baseband=csfb
BOARD_KERNEL_PAGESIZE           := 2048
BOARD_FORCE_RAMDISK_ADDRESS     := 0x41500000
TARGET_KERNEL_CONFIG            := msm8660-perf-EF40S_TP20_defconfig
TARGET_KERNEL_CUSTOM_TOOLCHAIN  := arm-eabi-4.4.3
TARGET_KERNEL_SOURCE            := ../test/ef40s-31
TARGET_PREBUILT_KERNEL          := device/pantech/ef40s/prebuilt/kernel/kernel

# SD Card info
BOARD_SDCARD_DEVICE_PRIMARY     := /dev/block/mmcblk1p1
BOARD_SDCARD_DEVICE_SECONDARY   := /dev/block/mmcblk1
BOARD_SDEXT_DEVICE              := /dev/block/mmcblk1p1

# USB
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# Vold
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_MAX_PARTITIONS := 28

# NFC
BOARD_HAVE_NFC := true

# Vibrator
BOARD_HAS_VIBRATOR_IMPLEMENTATION := ../../device/pantech/ef40s/vibrator/vibrator.c

# Wifi related defines
WIFI_BAND := 802_11_ABG
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE := bcmdhd
BOARD_LEGACY_NL80211_STA_EVENTS := true

WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA := "/system/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP := "/system/vendor/firmware/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P := "/system/vendor/firmware/fw_bcmdhd_p2p.bin"
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/bcmdhd.ko"
WIFI_DRIVER_MODULE_NAME     := "bcmdhd"
WIFI_DRIVER_MODULE_ARG      := "firmware_path=/system/etc/wifi/bcmdhd.bin nvram_path=/system/etc/wifi/nv_bcmdhd.txt"
WIFI_DRIVER_MODULE_AP_ARG   := "firmware_path=/system/etc/wifi/bcmdhd_apsta.bin nvram_path=/system/etc/wifi/nv_bcmdhd.txt"
