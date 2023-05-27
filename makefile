.EXPORT_ALL_VARIABLES:

MACOSX_DEPLOYMENT_TARGET = 10.13

7zz.dylib: CPP/7zip/Bundles/Alone2/b/m_arm64/7zz CPP/7zip/Bundles/Alone2/b/m_x64/7zz
	lipo $^ -create -output $@

FORCE: ;
CPP/7zip/Bundles/Alone2/b/m_arm64/7zz: FORCE
	$(MAKE) -C CPP/7zip/Bundles/Alone2 -f ../../cmpl_mac_arm64.mak DISABLE_RAR=1

CPP/7zip/Bundles/Alone2/b/m_x64/7zz: FORCE
	$(MAKE) -C CPP/7zip/Bundles/Alone2 -f ../../cmpl_mac_x64.mak DISABLE_RAR=1

.PHONY: clean
clean:
	$(MAKE) -C CPP/7zip/Bundles/Alone2 -f ../../cmpl_mac_x64.mak clean
	$(MAKE) -C CPP/7zip/Bundles/Alone2 -f ../../cmpl_mac_arm64.mak clean
