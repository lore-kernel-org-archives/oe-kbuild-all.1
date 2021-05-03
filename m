Content-Type: multipart/mixed; boundary="===============1468134749051007980=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: drivers/input/touchscreen/ads7846.c:705:24: warning: taking address of packed member 'data' of class or structure 'ads7846_buf' may result in an unaligned pointer value
Date: Tue, 04 May 2021 07:16:16 +0800
Message-ID: <202105040712.xpgT0n9z-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1468134749051007980==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5e321ded302da4d8c5d5dd953423d9b748ab3775
commit: 6965eece2a89c3f1d00881c6052ee1e987870c08 Input: ads7846 - convert t=
o one message
date:   3 months ago
config: mips-randconfig-r026-20210504 (attached as .config)
compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 8f5a2a=
5836cc8e4c1def2bdeb022e7b496623439)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D6965eece2a89c3f1d00881c6052ee1e987870c08
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 6965eece2a89c3f1d00881c6052ee1e987870c08
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=3D=
1 ARCH=3Dmips =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   # define __SYNC_loongson3_war   (1 << 31)
                                      ^
   In file included from drivers/input/touchscreen/ads7846.c:20:
   In file included from include/linux/sched.h:12:
   In file included from ./arch/mips/include/generated/asm/current.h:1:
   In file included from include/asm-generic/current.h:5:
   In file included from include/linux/thread_info.h:38:
   In file included from arch/mips/include/asm/thread_info.h:16:
   In file included from arch/mips/include/asm/processor.h:14:
   In file included from include/linux/atomic.h:7:
   arch/mips/include/asm/atomic.h:257:1: warning: converting the result of =
'<<' to a boolean always evaluates to true [-Wtautological-constant-compare]
   ATOMIC_SIP_OP(atomic, int, subu, ll, sc)
   ^
   arch/mips/include/asm/atomic.h:251:7: note: expanded from macro 'ATOMIC_=
SIP_OP'
           if (!__SYNC_loongson3_war)                                      \
                ^
   arch/mips/include/asm/sync.h:147:34: note: expanded from macro '__SYNC_l=
oongson3_war'
   # define __SYNC_loongson3_war   (1 << 31)
                                      ^
   In file included from drivers/input/touchscreen/ads7846.c:20:
   In file included from include/linux/sched.h:12:
   In file included from ./arch/mips/include/generated/asm/current.h:1:
   In file included from include/asm-generic/current.h:5:
   In file included from include/linux/thread_info.h:38:
   In file included from arch/mips/include/asm/thread_info.h:16:
   In file included from arch/mips/include/asm/processor.h:14:
   In file included from include/linux/atomic.h:7:
   arch/mips/include/asm/atomic.h:261:1: warning: converting the result of =
'<<' to a boolean always evaluates to true [-Wtautological-constant-compare]
   ATOMIC_SIP_OP(atomic64, s64, dsubu, lld, scd)
   ^
   arch/mips/include/asm/atomic.h:251:7: note: expanded from macro 'ATOMIC_=
SIP_OP'
           if (!__SYNC_loongson3_war)                                      \
                ^
   arch/mips/include/asm/sync.h:147:34: note: expanded from macro '__SYNC_l=
oongson3_war'
   # define __SYNC_loongson3_war   (1 << 31)
                                      ^
   In file included from drivers/input/touchscreen/ads7846.c:20:
   In file included from include/linux/sched.h:14:
   In file included from include/linux/pid.h:5:
   In file included from include/linux/rculist.h:11:
   In file included from include/linux/rcupdate.h:29:
   In file included from include/linux/lockdep.h:14:
   In file included from include/linux/smp.h:15:
   In file included from include/linux/smp_types.h:5:
   include/linux/llist.h:222:9: warning: converting the result of '<<' to a=
 boolean always evaluates to true [-Wtautological-constant-compare]
           return xchg(&head->first, NULL);
                  ^
   arch/mips/include/asm/cmpxchg.h:102:7: note: expanded from macro 'xchg'
           if (!__SYNC_loongson3_war)                                      \
                ^
   arch/mips/include/asm/sync.h:147:34: note: expanded from macro '__SYNC_l=
oongson3_war'
   # define __SYNC_loongson3_war   (1 << 31)
                                      ^
   In file included from drivers/input/touchscreen/ads7846.c:20:
   In file included from include/linux/sched.h:14:
   In file included from include/linux/pid.h:5:
   In file included from include/linux/rculist.h:11:
   In file included from include/linux/rcupdate.h:29:
   In file included from include/linux/lockdep.h:27:
   include/linux/debug_locks.h:17:9: warning: converting the result of '<<'=
 to a boolean always evaluates to true [-Wtautological-constant-compare]
           return xchg(&debug_locks, 0);
                  ^
   arch/mips/include/asm/cmpxchg.h:102:7: note: expanded from macro 'xchg'
           if (!__SYNC_loongson3_war)                                      \
                ^
   arch/mips/include/asm/sync.h:147:34: note: expanded from macro '__SYNC_l=
oongson3_war'
   # define __SYNC_loongson3_war   (1 << 31)
                                      ^
   In file included from drivers/input/touchscreen/ads7846.c:31:
   In file included from include/linux/spi/spi.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:33:
   In file included from include/linux/pgtable.h:6:
   arch/mips/include/asm/pgtable.h:210:3: warning: converting the result of=
 '<<' to a boolean always evaluates to true [-Wtautological-constant-compar=
e]
                   cmpxchg64(&buddy->pte, 0, _PAGE_GLOBAL);
                   ^
   arch/mips/include/asm/cmpxchg.h:220:2: note: expanded from macro 'cmpxch=
g64'
           cmpxchg((ptr), (o), (n));                                       \
           ^
   arch/mips/include/asm/cmpxchg.h:194:7: note: expanded from macro 'cmpxch=
g'
           if (!__SYNC_loongson3_war)                                      \
                ^
   arch/mips/include/asm/sync.h:147:34: note: expanded from macro '__SYNC_l=
oongson3_war'
   # define __SYNC_loongson3_war   (1 << 31)
                                      ^
   In file included from drivers/input/touchscreen/ads7846.c:31:
   In file included from include/linux/spi/spi.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:33:
   In file included from include/linux/pgtable.h:6:
   arch/mips/include/asm/pgtable.h:210:3: warning: converting the result of=
 '<<' to a boolean always evaluates to true [-Wtautological-constant-compar=
e]
   arch/mips/include/asm/cmpxchg.h:220:2: note: expanded from macro 'cmpxch=
g64'
           cmpxchg((ptr), (o), (n));                                       \
           ^
   arch/mips/include/asm/cmpxchg.h:204:7: note: expanded from macro 'cmpxch=
g'
           if (!__SYNC_loongson3_war)                                      \
                ^
   arch/mips/include/asm/sync.h:147:34: note: expanded from macro '__SYNC_l=
oongson3_war'
   # define __SYNC_loongson3_war   (1 << 31)
                                      ^
>> drivers/input/touchscreen/ads7846.c:705:24: warning: taking address of p=
acked member 'data' of class or structure 'ads7846_buf' may result in an un=
aligned pointer value [-Waddress-of-packed-member]
           value =3D be16_to_cpup(&buf->data);
                                 ^~~~~~~~~
   13 warnings generated.


vim +705 drivers/input/touchscreen/ads7846.c

   700	=

   701	static int ads7846_get_value(struct ads7846_buf *buf)
   702	{
   703		int value;
   704	=

 > 705		value =3D be16_to_cpup(&buf->data);
   706	=

   707		/* enforce ADC output is 12 bits width */
   708		return (value >> 3) & 0xfff;
   709	}
   710	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1468134749051007980==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
CAIA
--===============1468134749051007980==--

