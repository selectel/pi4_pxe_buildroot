################################################################################
#
# dhtest
#
################################################################################
# https://codeload.github.com/saravana815/dhtest/zip/master
# https://github.com/saravana815/dhtest/archive/v1.5.tar.gz

DHTEST_VERSION = 1.5
DHTEST_SOURCE = v$(DHTEST_VERSION).tar.gz
DHTEST_SITE = https://github.com/saravana815/dhtest/archive
DHTEST_LICENSE = GPL-2.0+
DHTEST_LICENSE_FILES = LICENSE

define DHTEST_BUILD_CMDS
    $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) dhtest
endef

define DHTEST_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/dhtest $(TARGET_DIR)/usr/bin
endef

define DHTEST_PERMISSIONS
    /bin/dhtest  f  4755  root  root   -  -  -  -  -
endef

$(eval $(generic-package))
