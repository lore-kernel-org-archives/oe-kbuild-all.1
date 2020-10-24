Content-Type: multipart/mixed; boundary="===============1944298708110358196=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v4] fat: Add KUnit tests for checksums and timestamps
Date: Sat, 24 Oct 2020 13:54:09 +0800
Message-ID: <202010241330.3jsFukha-lkp@intel.com>
In-Reply-To: <20201024052047.2526780-1-davidgow@google.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1944298708110358196==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi David,

I love your patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v5.9 next-20201023]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/David-Gow/fat-Add-KUnit-te=
sts-for-checksums-and-timestamps/20201024-132133
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
f11901ed723d1351843771c3a84b03a253bbf8b2
config: sparc-randconfig-s031-20201024
compiler: sparc-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-17-g2d3af347-dirty
        # https://github.com/0day-ci/linux/commit/3904bec3c79102be934e8021a=
bb02c9176f099d7
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review David-Gow/fat-Add-KUnit-tests-for-=
checksums-and-timestamps/20201024-132133
        git checkout 3904bec3c79102be934e8021abb02c9176f099d7
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Dsparc =


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
--===============1944298708110358196==--

