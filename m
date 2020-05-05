Content-Type: multipart/mixed; boundary="===============1652208126482116096=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [RFC v4][PATCH part-1 5/7] mm/asi: Exit/enter ASI when task enters/exits scheduler
Date: Tue, 05 May 2020 08:27:59 +0800
Message-ID: <202005050841.vBlTYqmV%lkp@intel.com>
In-Reply-To: <20200504144939.11318-6-alexandre.chartre@oracle.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1652208126482116096==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Alexandre,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on tip/x86/asm]
[also build test ERROR on tip/x86/core v5.7-rc4]
[cannot apply to tip/x86/mm next-20200504]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Alexandre-Chartre/ASI-Part=
-I-ASI-Infrastructure-and-PTI/20200505-074555
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git 2ce0d7f=
9766f0e49bb54f149c77bae89464932fb
config: h8300-h8s-sim_defconfig (attached as .config)
compiler: h8300-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day GCC_VERSION=3D9.3.0 make.cross A=
RCH=3Dh8300 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/h8300/kernel/asm-offsets.c:13:
>> include/linux/sched.h:13:10: fatal error: asm/asi_session.h: No such fil=
e or directory
      13 | #include <asm/asi_session.h>
         |          ^~~~~~~~~~~~~~~~~~~
   compilation terminated.
   make[2]: *** [scripts/Makefile.build:100: arch/h8300/kernel/asm-offsets.=
s] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1141: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:180: sub-make] Error 2

vim +13 include/linux/sched.h

    11	=

    12	#include <asm/current.h>
  > 13	#include <asm/asi_session.h>
    14	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1652208126482116096==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
Tod41sQMEnA6oP9fsB7pC+lKAAA=
--===============1652208126482116096==--

