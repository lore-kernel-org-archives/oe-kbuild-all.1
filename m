Content-Type: multipart/mixed; boundary="===============0430223413287879048=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [linux-review:UPDATE-20201024-140140/David-Gow/fat-Add-KUnit-tests-for-checksums-and-timestamps/20201024-132133 1/1] fs/fat/Kconfig:122: syntax error
Date: Sun, 25 Oct 2020 00:18:25 +0800
Message-ID: <202010250023.ZTeoWlga-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0430223413287879048==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/0day-ci/linux/commits/UPDATE-20201024-140140/Dav=
id-Gow/fat-Add-KUnit-tests-for-checksums-and-timestamps/20201024-132133
head:   7f740bf9e3589c44ed092f9e0ef1742bc51e330e
commit: 7f740bf9e3589c44ed092f9e0ef1742bc51e330e [1/1] fat: Add KUnit tests=
 for checksums and timestamps
config: x86_64-rhel
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
reproduce (this is a W=3D1 build):
        # https://github.com/0day-ci/linux/commit/7f740bf9e3589c44ed092f9e0=
ef1742bc51e330e
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review UPDATE-20201024-140140/David-Gow/f=
at-Add-KUnit-tests-for-checksums-and-timestamps/20201024-132133
        git checkout 7f740bf9e3589c44ed092f9e0ef1742bc51e330e
        # save the attached .config to linux build tree
        make W=3D1 ARCH=3Dx86_64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   fs/fat/Kconfig:121:warning: ignoring unsupported character '&'
>> fs/fat/Kconfig:122: syntax error
   fs/fat/Kconfig:121: invalid statement
   fs/fat/Kconfig:122: invalid statement
   fs/fat/Kconfig:123: invalid statement
   fs/fat/Kconfig:124: unknown statement "This"
   fs/fat/Kconfig:126:warning: ignoring unsupported character ','
   fs/fat/Kconfig:126: unknown statement "For"
   fs/fat/Kconfig:127:warning: ignoring unsupported character '/'
   fs/fat/Kconfig:127:warning: ignoring unsupported character '/'
   fs/fat/Kconfig:127: unknown statement "to"
   fs/fat/Kconfig:129:warning: ignoring unsupported character ','
   fs/fat/Kconfig:129: unknown statement "If"
   make[2]: *** [scripts/kconfig/Makefile:71: oldconfig] Error 1
   make[1]: *** [Makefile:604: oldconfig] Error 2
   make: *** [Makefile:185: __sub-make] Error 2
   make: Target 'oldconfig' not remade because of errors.
--
   fs/fat/Kconfig:121:warning: ignoring unsupported character '&'
>> fs/fat/Kconfig:122: syntax error
   fs/fat/Kconfig:121: invalid statement
   fs/fat/Kconfig:122: invalid statement
   fs/fat/Kconfig:123: invalid statement
   fs/fat/Kconfig:124: unknown statement "This"
   fs/fat/Kconfig:126:warning: ignoring unsupported character ','
   fs/fat/Kconfig:126: unknown statement "For"
   fs/fat/Kconfig:127:warning: ignoring unsupported character '/'
   fs/fat/Kconfig:127:warning: ignoring unsupported character '/'
   fs/fat/Kconfig:127: unknown statement "to"
   fs/fat/Kconfig:129:warning: ignoring unsupported character ','
   fs/fat/Kconfig:129: unknown statement "If"
   make[2]: *** [scripts/kconfig/Makefile:71: olddefconfig] Error 1
   make[1]: *** [Makefile:604: olddefconfig] Error 2
   make: *** [Makefile:185: __sub-make] Error 2
   make: Target 'olddefconfig' not remade because of errors.

vim +122 fs/fat/Kconfig

 > 122		default KUNIT_ALL_TESTS

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0430223413287879048==--

