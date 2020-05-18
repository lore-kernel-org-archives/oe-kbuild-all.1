Content-Type: multipart/mixed; boundary="===============6448740602637696191=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [sashal-linux-stable:queue-4.4 57/62] init/Kconfig:21: syntax error
Date: Tue, 19 May 2020 04:44:27 +0800
Message-ID: <202005190425.YeXcrgUV%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6448740602637696191==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable=
.git queue-4.4
head:   357f5caad90a59b23d9a6c3f4961da3b02316dbd
commit: a68363916acd81f8d65be02e8e6c79bd16554fb1 [57/62] kbuild: compute fa=
lse-positive -Wmaybe-uninitialized cases in Kconfig
config: i386-tinyconfig
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce:
        git checkout a68363916acd81f8d65be02e8e6c79bd16554fb1
        make ARCH=3Di386  tinyconfig
        make ARCH=3Di386 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

Note: the sashal-linux-stable/queue-4.4 HEAD 357f5caad90a59b23d9a6c3f4961da=
3b02316dbd builds fine.
      It only hurts bisectibility.

All errors (new ones prefixed by >>, old ones prefixed by <<):

init/Kconfig:20:warning: ignoring unsupported character '$'
init/Kconfig:20:warning: ignoring unsupported character ','
>> init/Kconfig:21: syntax error
init/Kconfig:20: invalid option
init/Kconfig:1351: syntax error
init/Kconfig:1350: unknown option "imply"
>> kernel/trace/Kconfig:316: syntax error
kernel/trace/Kconfig:315: unknown option "imply"
make[2]: *** [scripts/kconfig/Makefile:84: oldconfig] Error 1
make[1]: *** [Makefile:540: oldconfig] Error 2
make: *** [Makefile:152: sub-make] Error 2
--
init/Kconfig:20:warning: ignoring unsupported character '$'
init/Kconfig:20:warning: ignoring unsupported character ','
>> init/Kconfig:21: syntax error
init/Kconfig:20: invalid option
init/Kconfig:1351: syntax error
init/Kconfig:1350: unknown option "imply"
>> kernel/trace/Kconfig:316: syntax error
kernel/trace/Kconfig:315: unknown option "imply"
make[2]: *** [scripts/kconfig/Makefile:84: olddefconfig] Error 1
make[1]: *** [Makefile:540: olddefconfig] Error 2
make: *** [Makefile:152: sub-make] Error 2
--
init/Kconfig:20:warning: ignoring unsupported character '$'
init/Kconfig:20:warning: ignoring unsupported character ','
>> init/Kconfig:21: syntax error
init/Kconfig:20: invalid option
init/Kconfig:1351: syntax error
init/Kconfig:1350: unknown option "imply"
>> kernel/trace/Kconfig:316: syntax error
kernel/trace/Kconfig:315: unknown option "imply"
make[5]: *** [scripts/kconfig/Makefile:84: allnoconfig] Error 1
make[4]: *** [Makefile:540: allnoconfig] Error 2
make[3]: *** [Makefile:519: __build_one_by_one] Error 2
make[3]: Target 'allnoconfig' not remade because of errors.
make[3]: Target 'tiny.config' not remade because of errors.
make[2]: *** [scripts/kconfig/Makefile:129: tinyconfig] Error 2
make[1]: *** [Makefile:540: tinyconfig] Error 2
make: *** [Makefile:152: sub-make] Error 2

vim +21 init/Kconfig

  > 21		help
    22		  GCC >=3D 4.7 supports this option.
    23	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6448740602637696191==--

