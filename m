Content-Type: multipart/mixed; boundary="===============0895296949111787916=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [RFC] taint: add module firmware crash taint support
Date: Sat, 09 May 2020 04:37:26 +0800
Message-ID: <202005090433.qEPCCfmW%lkp@intel.com>
In-Reply-To: <20200508021438.4373-1-mcgrof@kernel.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0895296949111787916==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Luis,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on ath6kl/ath-next]
[also build test ERROR on jeyu/modules-next mkp-scsi/for-next scsi/for-next=
 tip/perf/core linus/master v5.7-rc4 next-20200508]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Luis-Chamberlain/taint-add=
-module-firmware-crash-taint-support/20200509-023119
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-n=
ext
config: sh-shmin_defconfig (attached as .config)
compiler: sh4-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day GCC_VERSION=3D9.3.0 make.cross A=
RCH=3Dsh =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/bpf.h:20,
                    from include/linux/bpf-cgroup.h:5,
                    from include/linux/cgroup-defs.h:22,
                    from include/linux/cgroup.h:28,
                    from include/linux/memcontrol.h:13,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from arch/sh/kernel/asm-offsets.c:16:
   include/linux/module.h: In function 'module_firmware_crashed':
>> include/linux/module.h:857:34: error: 'val' undeclared (first use in thi=
s function)
     857 |  add_taint(TAINT_FIRMWARE_CRASH, val);
         |                                  ^~~
   include/linux/module.h:857:34: note: each undeclared identifier is repor=
ted only once for each function it appears in
   make[2]: *** [scripts/Makefile.build:100: arch/sh/kernel/asm-offsets.s] =
Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1141: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:180: sub-make] Error 2

vim +/val +857 include/linux/module.h

   854	=

   855	static inline void module_firmware_crashed(void)
   856	{
 > 857		add_taint(TAINT_FIRMWARE_CRASH, val);
   858	}
   859	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0895296949111787916==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============0895296949111787916==--

