Content-Type: multipart/mixed; boundary="===============1364964289204073185=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [mark-rutland:atomics/arch-atomic 20/34] arch/m68k/include/asm/atomic.h:176:3: error: implicit declaration of function 'atomic_set'; did you mean 'arch_atomic_set'?
Date: Tue, 04 May 2021 20:19:38 +0800
Message-ID: <202105042027.IKfNG0CJ-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1364964289204073185==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git atom=
ics/arch-atomic
head:   112eeff17854f7a5dc10153796942bb9ed4f88ff
commit: 069fb0ec45621addb369d859281ede9d206f1d49 [20/34] locking/atomic: m6=
8k: move to ARCH_ATOMIC
config: m68k-randconfig-r002-20210504 (attached as .config)
compiler: m68k-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/co=
mmit/?id=3D069fb0ec45621addb369d859281ede9d206f1d49
        git remote add mark-rutland https://git.kernel.org/pub/scm/linux/ke=
rnel/git/mark/linux.git
        git fetch --no-tags mark-rutland atomics/arch-atomic
        git checkout 069fb0ec45621addb369d859281ede9d206f1d49
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
W=3D1 ARCH=3Dm68k =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/atomic.h:7,
                    from include/linux/rcupdate.h:25,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from arch/m68k/kernel/asm-offsets.c:15:
   arch/m68k/include/asm/atomic.h: In function 'arch_atomic_cmpxchg':
>> arch/m68k/include/asm/atomic.h:176:3: error: implicit declaration of fun=
ction 'atomic_set'; did you mean 'arch_atomic_set'? [-Werror=3Dimplicit-fun=
ction-declaration]
     176 |   atomic_set(v, new);
         |   ^~~~~~~~~~
         |   arch_atomic_set
   In file included from include/linux/atomic.h:82,
                    from include/linux/rcupdate.h:25,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from arch/m68k/kernel/asm-offsets.c:15:
   include/asm-generic/atomic-instrumented.h: At top level:
>> include/asm-generic/atomic-instrumented.h:43:1: warning: conflicting typ=
es for 'atomic_set'
      43 | atomic_set(atomic_t *v, int i)
         | ^~~~~~~~~~
>> include/asm-generic/atomic-instrumented.h:43:1: error: static declaratio=
n of 'atomic_set' follows non-static declaration
   In file included from include/linux/atomic.h:7,
                    from include/linux/rcupdate.h:25,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from arch/m68k/kernel/asm-offsets.c:15:
   arch/m68k/include/asm/atomic.h:176:3: note: previous implicit declaratio=
n of 'atomic_set' was here
     176 |   atomic_set(v, new);
         |   ^~~~~~~~~~
   In file included from include/linux/atomic.h:87,
                    from include/linux/rcupdate.h:25,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from arch/m68k/kernel/asm-offsets.c:15:
   include/asm-generic/atomic-long.h: In function 'atomic_long_add_return':
   include/asm-generic/atomic-long.h:553:9: error: implicit declaration of =
function 'atomic_add_return'; did you mean 'atomic64_add_return'? [-Werror=
=3Dimplicit-function-declaration]
     553 |  return atomic_add_return(i, v);
         |         ^~~~~~~~~~~~~~~~~
         |         atomic64_add_return
   include/asm-generic/atomic-long.h: In function 'atomic_long_fetch_add':
   include/asm-generic/atomic-long.h:577:9: error: implicit declaration of =
function 'atomic_fetch_add'; did you mean 'atomic64_fetch_add'? [-Werror=3D=
implicit-function-declaration]
     577 |  return atomic_fetch_add(i, v);
         |         ^~~~~~~~~~~~~~~~
         |         atomic64_fetch_add
   include/asm-generic/atomic-long.h: In function 'atomic_long_sub_return':
   include/asm-generic/atomic-long.h:607:9: error: implicit declaration of =
function 'atomic_sub_return'; did you mean 'atomic64_sub_return'? [-Werror=
=3Dimplicit-function-declaration]
     607 |  return atomic_sub_return(i, v);
         |         ^~~~~~~~~~~~~~~~~
         |         atomic64_sub_return
   include/asm-generic/atomic-long.h: In function 'atomic_long_fetch_sub':
   include/asm-generic/atomic-long.h:631:9: error: implicit declaration of =
function 'atomic_fetch_sub'; did you mean 'atomic64_fetch_sub'? [-Werror=3D=
implicit-function-declaration]
     631 |  return atomic_fetch_sub(i, v);
         |         ^~~~~~~~~~~~~~~~
         |         atomic64_fetch_sub
   include/asm-generic/atomic-long.h: In function 'atomic_long_fetch_and':
   include/asm-generic/atomic-long.h:769:9: error: implicit declaration of =
function 'atomic_fetch_and'; did you mean 'atomic64_fetch_and'? [-Werror=3D=
implicit-function-declaration]
     769 |  return atomic_fetch_and(i, v);
         |         ^~~~~~~~~~~~~~~~
         |         atomic64_fetch_and
   include/asm-generic/atomic-long.h: In function 'atomic_long_fetch_or':
   include/asm-generic/atomic-long.h:829:9: error: implicit declaration of =
function 'atomic_fetch_or'; did you mean 'atomic64_fetch_or'? [-Werror=3Dim=
plicit-function-declaration]
     829 |  return atomic_fetch_or(i, v);
         |         ^~~~~~~~~~~~~~~
         |         atomic64_fetch_or
   include/asm-generic/atomic-long.h: In function 'atomic_long_fetch_xor':
   include/asm-generic/atomic-long.h:859:9: error: implicit declaration of =
function 'atomic_fetch_xor'; did you mean 'atomic64_fetch_xor'? [-Werror=3D=
implicit-function-declaration]
     859 |  return atomic_fetch_xor(i, v);
         |         ^~~~~~~~~~~~~~~~
         |         atomic64_fetch_xor
   include/asm-generic/atomic-long.h: In function 'atomic_long_xchg':
   include/asm-generic/atomic-long.h:883:9: error: implicit declaration of =
function 'atomic_xchg'; did you mean 'atomic64_xchg'? [-Werror=3Dimplicit-f=
unction-declaration]
     883 |  return atomic_xchg(v, i);
         |         ^~~~~~~~~~~
         |         atomic64_xchg
   include/asm-generic/atomic-long.h: In function 'atomic_long_cmpxchg':
   include/asm-generic/atomic-long.h:907:9: error: implicit declaration of =
function 'atomic_cmpxchg'; did you mean 'atomic64_cmpxchg'? [-Werror=3Dimpl=
icit-function-declaration]
     907 |  return atomic_cmpxchg(v, old, new);
         |         ^~~~~~~~~~~~~~
         |         atomic64_cmpxchg
   cc1: some warnings being treated as errors
--
   In file included from include/linux/atomic.h:7,
                    from include/linux/rcupdate.h:25,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from arch/m68k/kernel/asm-offsets.c:15:
   arch/m68k/include/asm/atomic.h: In function 'arch_atomic_cmpxchg':
>> arch/m68k/include/asm/atomic.h:176:3: error: implicit declaration of fun=
ction 'atomic_set'; did you mean 'arch_atomic_set'? [-Werror=3Dimplicit-fun=
ction-declaration]
     176 |   atomic_set(v, new);
         |   ^~~~~~~~~~
         |   arch_atomic_set
   In file included from include/linux/atomic.h:82,
                    from include/linux/rcupdate.h:25,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from arch/m68k/kernel/asm-offsets.c:15:
   include/asm-generic/atomic-instrumented.h: At top level:
>> include/asm-generic/atomic-instrumented.h:43:1: warning: conflicting typ=
es for 'atomic_set'
      43 | atomic_set(atomic_t *v, int i)
         | ^~~~~~~~~~
>> include/asm-generic/atomic-instrumented.h:43:1: error: static declaratio=
n of 'atomic_set' follows non-static declaration
   In file included from include/linux/atomic.h:7,
                    from include/linux/rcupdate.h:25,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from arch/m68k/kernel/asm-offsets.c:15:
   arch/m68k/include/asm/atomic.h:176:3: note: previous implicit declaratio=
n of 'atomic_set' was here
     176 |   atomic_set(v, new);
         |   ^~~~~~~~~~
   In file included from include/linux/atomic.h:87,
                    from include/linux/rcupdate.h:25,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from arch/m68k/kernel/asm-offsets.c:15:
   include/asm-generic/atomic-long.h: In function 'atomic_long_add_return':
   include/asm-generic/atomic-long.h:553:9: error: implicit declaration of =
function 'atomic_add_return'; did you mean 'atomic64_add_return'? [-Werror=
=3Dimplicit-function-declaration]
     553 |  return atomic_add_return(i, v);
         |         ^~~~~~~~~~~~~~~~~
         |         atomic64_add_return
   include/asm-generic/atomic-long.h: In function 'atomic_long_fetch_add':
   include/asm-generic/atomic-long.h:577:9: error: implicit declaration of =
function 'atomic_fetch_add'; did you mean 'atomic64_fetch_add'? [-Werror=3D=
implicit-function-declaration]
     577 |  return atomic_fetch_add(i, v);
         |         ^~~~~~~~~~~~~~~~
         |         atomic64_fetch_add
   include/asm-generic/atomic-long.h: In function 'atomic_long_sub_return':
   include/asm-generic/atomic-long.h:607:9: error: implicit declaration of =
function 'atomic_sub_return'; did you mean 'atomic64_sub_return'? [-Werror=
=3Dimplicit-function-declaration]
     607 |  return atomic_sub_return(i, v);
         |         ^~~~~~~~~~~~~~~~~
         |         atomic64_sub_return
   include/asm-generic/atomic-long.h: In function 'atomic_long_fetch_sub':
   include/asm-generic/atomic-long.h:631:9: error: implicit declaration of =
function 'atomic_fetch_sub'; did you mean 'atomic64_fetch_sub'? [-Werror=3D=
implicit-function-declaration]
     631 |  return atomic_fetch_sub(i, v);
         |         ^~~~~~~~~~~~~~~~
         |         atomic64_fetch_sub
   include/asm-generic/atomic-long.h: In function 'atomic_long_fetch_and':
   include/asm-generic/atomic-long.h:769:9: error: implicit declaration of =
function 'atomic_fetch_and'; did you mean 'atomic64_fetch_and'? [-Werror=3D=
implicit-function-declaration]
     769 |  return atomic_fetch_and(i, v);
         |         ^~~~~~~~~~~~~~~~
         |         atomic64_fetch_and
   include/asm-generic/atomic-long.h: In function 'atomic_long_fetch_or':
   include/asm-generic/atomic-long.h:829:9: error: implicit declaration of =
function 'atomic_fetch_or'; did you mean 'atomic64_fetch_or'? [-Werror=3Dim=
plicit-function-declaration]
     829 |  return atomic_fetch_or(i, v);
         |         ^~~~~~~~~~~~~~~
         |         atomic64_fetch_or
   include/asm-generic/atomic-long.h: In function 'atomic_long_fetch_xor':
   include/asm-generic/atomic-long.h:859:9: error: implicit declaration of =
function 'atomic_fetch_xor'; did you mean 'atomic64_fetch_xor'? [-Werror=3D=
implicit-function-declaration]
     859 |  return atomic_fetch_xor(i, v);
         |         ^~~~~~~~~~~~~~~~
         |         atomic64_fetch_xor
   include/asm-generic/atomic-long.h: In function 'atomic_long_xchg':
   include/asm-generic/atomic-long.h:883:9: error: implicit declaration of =
function 'atomic_xchg'; did you mean 'atomic64_xchg'? [-Werror=3Dimplicit-f=
unction-declaration]
     883 |  return atomic_xchg(v, i);
         |         ^~~~~~~~~~~
         |         atomic64_xchg
   include/asm-generic/atomic-long.h: In function 'atomic_long_cmpxchg':
   include/asm-generic/atomic-long.h:907:9: error: implicit declaration of =
function 'atomic_cmpxchg'; did you mean 'atomic64_cmpxchg'? [-Werror=3Dimpl=
icit-function-declaration]
     907 |  return atomic_cmpxchg(v, old, new);
         |         ^~~~~~~~~~~~~~
         |         atomic64_cmpxchg
   cc1: some warnings being treated as errors
   make[2]: *** [scripts/Makefile.build:116: arch/m68k/kernel/asm-offsets.s=
] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1235: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:215: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +176 arch/m68k/include/asm/atomic.h

69f99746a2cfd8 Greg Ungerer 2010-09-08  167  =

069fb0ec45621a Mark Rutland 2021-04-27  168  static inline int arch_atomic_=
cmpxchg(atomic_t *v, int old, int new)
69f99746a2cfd8 Greg Ungerer 2010-09-08  169  {
69f99746a2cfd8 Greg Ungerer 2010-09-08  170  	unsigned long flags;
69f99746a2cfd8 Greg Ungerer 2010-09-08  171  	int prev;
69f99746a2cfd8 Greg Ungerer 2010-09-08  172  =

69f99746a2cfd8 Greg Ungerer 2010-09-08  173  	local_irq_save(flags);
069fb0ec45621a Mark Rutland 2021-04-27  174  	prev =3D arch_atomic_read(v);
69f99746a2cfd8 Greg Ungerer 2010-09-08  175  	if (prev =3D=3D old)
69f99746a2cfd8 Greg Ungerer 2010-09-08 @176  		atomic_set(v, new);
69f99746a2cfd8 Greg Ungerer 2010-09-08  177  	local_irq_restore(flags);
69f99746a2cfd8 Greg Ungerer 2010-09-08  178  	return prev;
69f99746a2cfd8 Greg Ungerer 2010-09-08  179  }
69f99746a2cfd8 Greg Ungerer 2010-09-08  180  =


:::::: The code at line 176 was first introduced by commit
:::::: 69f99746a2cfd88b9caed8e320ad86405b228ada m68k/m68knommu: merge MMU a=
nd non-MMU atomic.h

:::::: TO: Greg Ungerer <gerg@snapgear.com>
:::::: CC: Geert Uytterhoeven <geert@linux-m68k.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1364964289204073185==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
CgEA
--===============1364964289204073185==--

