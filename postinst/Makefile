include $(THEOS)/makefiles/common.mk

TOOL_NAME = postinst

postinst_FILES = postinst.mm
postinst_CFLAGS += -fvisibility=hidden -DPOSTINST -fobjc-arc
postinst_FRAMEWORKS = CoreFoundation
postinst_INSTALL_PATH = /DEBIAN
postinst_CODESIGN_FLAGS = -S../entitlements.xml

include $(THEOS_MAKE_PATH)/tool.mk

include $(THEOS_MAKE_PATH)/aggregate.mk
