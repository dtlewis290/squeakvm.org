#
# For platform builds, use
#
# PLUGIN_REQUIRE_PACKAGE (OPENSSL openssl)
# add_definitions(-DSQSSL_OPENSSL_LINKED) 
#
# otherwise the OpenSSL libs will be looked up at runtime.

PLUGIN_REQUIRE_PACKAGE (OPENSSL openssl)

# Traditional dynamic linking.
#
# PLUGIN_DEFINITIONS("-DSQSSL_OPENSSL_LINKED")

# Runtime symbol and function lookup.
# Portable across platforms because only required symbols are looked up.
# Requires a Gnu extension for implementation of symbol lookup.
#
PLUGIN_DEFINITIONS("-D_GNU_SOURCE")

################################################################################
#            Explanation from commit notice on opensmalltalk-vm:               #
################################################################################
#
#commit 49353ed2783531b3c8fcb7a522dc6f578ea5414c
#Author: Tobias Pape <tobias@netshed.de>
#Date:   Tue Jan 30 20:09:38 2018 +0100
#
#    [SqueakSSL] Overlay OpenSSL for linux/unix
#    
#    When we dynamically link against OpenSSL, the bundles are not portable,
#    as CentOS and friends use other SO_NAMEs than Debian and friends. Also,
#    soft-fallback for later features such as host name verification is hard.
#    
#    When we statically link, we might lack behind the OS, the binaries are
#    bigger, and the legal situation is less clear.
#    
#    So we now support not linking at all but rather lookup all necessary
#    functions/symbols at runtime.
#    
#    This can be disabled with SQSSL_OPENSSL_LINKED which effectively results
#    in the dynamically-linked behavior. (This is preferable for platform
#    builds, eg, debs and rpms)

