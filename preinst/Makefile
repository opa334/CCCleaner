include $(THEOS)/makefiles/common.mk

TOOL_NAME = preinst

preinst_FILES = preinst.mm
preinst_CFLAGS += -fvisibility=hidden -DPREINST -fobjc-arc
preinst_FRAMEWORKS = CoreFoundation
preinst_INSTALL_PATH = /DEBIAN
preinst_CODESIGN_FLAGS = -S../entitlements.xml

include $(THEOS_MAKE_PATH)/tool.mk

include $(THEOS_MAKE_PATH)/aggregate.mk
