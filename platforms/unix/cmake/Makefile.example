# Sun Oct  2 18:26:35 EDT 2016 dtl
#
# Makefile to build and install a 32-bit and 64-bit object memory VM. This
# makefile can be run with /usr/sbin/checkinstall to create an RPM or Debian
# install package.
#
# Copy this Makefile to your own empty ./build directory
#
# Assume platforms is ../platforms and src is ../src

# CFLAGS setting to pass to cmake configure. If undefined, use compiler defaults.
CFLAGS_PARAM="--CFLAGS='-O2 -D_FILE_OFFSET_BITS=64'"
#CFLAGS_PARAM="--CFLAGS='-O0 -g'"

# Extra parameters for the cmake/configure step. Example below
# will install in /usr/bin rather than /usr/local/bin, use shared
# libraries, and install the run script as /usr/bin/squeakvm
# (uncomment for Debian squeak-vm package distribution support)
#CONFIG_PARAMS= --prefix=/usr --link-shared-lib --scriptname=squeakvm

O=/usr/local
P=../../platforms
S=../../src

squeakvm:	build/squeakvm build64/squeakvm64

build/squeakvm:	build/CMakeCache.txt
	(cd build; make)

build/CMakeCache.txt:
	mkdir build || true
	(cd build; ${P}/unix/cmake/configure --prefix=${O} --src=${S} ${CONFIG_PARAMS} ${CFLAGS_PARAM})

build64/squeakvm64:	build64/CMakeCache.txt
	(cd build64; make)

build64/CMakeCache.txt:
	mkdir build64 || true
	(cd build64; ${P}/unix/cmake/configure --prefix=${O} --src=${S} --image64 --vm-only ${CONFIG_PARAMS} ${CFLAGS_PARAM})

install:	squeakvm
	(cd build; make install)
	(cd build64; make install)

# Make Debian package with checkinstall
deb:	squeakvm
	checkinstall -D --nodoc --pkgname 'squeakvm' \
		--pkgversion `grep ' VM_VERSION ' build/config.h | sed 's/.*VERSION //' | sed 's/\"//g'` \
		make install

clean:
	rm -rf build build64

