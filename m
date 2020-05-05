Content-Type: multipart/mixed; boundary="===============6012659095324915778=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [arnd-playground:randconfig-20200504 208/355] include/asm-generic/barrier.h:186:29: error: expected '; ' before '___p1'
Date: Tue, 05 May 2020 23:07:53 +0800
Message-ID: <202005052348.ugX8HhPD%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6012659095324915778==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git=
 randconfig-20200504
head:   5867adb94a59773ef2e3262b70538803fe896906
commit: e223eea60ffdf2083bb2472bcba82850aced3ccb [208/355] locking/barriers=
: Use '__unqual_scalar_typeof' for load-acquire macros
config: nds32-defconfig (attached as .config)
compiler: nds32le-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout e223eea60ffdf2083bb2472bcba82850aced3ccb
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day GCC_VERSION=3D9.3.0 make.cross A=
RCH=3Dnds32 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

Note: the arnd-playground/randconfig-20200504 HEAD 5867adb94a59773ef2e3262b=
70538803fe896906 builds fine.
      It only hurts bisectibility.

All error/warnings (new ones prefixed by >>):

   In file included from arch/nds32/include/asm/barrier.h:11,
                    from include/linux/compiler.h:280,
                    from include/asm-generic/bug.h:5,
                    from ./arch/nds32/include/generated/asm/bug.h:1,
                    from include/linux/bug.h:5,
                    from include/linux/page-flags.h:10,
                    from kernel/bounds.c:10:
   include/linux/atomic-fallback.h: In function 'atomic_read_acquire':
>> include/asm-generic/barrier.h:186:2: warning: implicit declaration of fu=
nction '__unqual_scalar_typeof' [-Wimplicit-function-declaration]
     186 |  __unqual_scalar_typeof(*p) ___p1 =3D READ_ONCE(*p);  \
         |  ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic-fallback.h:84:9: note: in expansion of macro 'smp_l=
oad_acquire'
      84 |  return smp_load_acquire(&(v)->counter);
         |         ^~~~~~~~~~~~~~~~
>> include/asm-generic/barrier.h:186:29: error: expected ';' before '___p1'
     186 |  __unqual_scalar_typeof(*p) ___p1 =3D READ_ONCE(*p);  \
         |                             ^~~~~
   include/linux/atomic-fallback.h:84:9: note: in expansion of macro 'smp_l=
oad_acquire'
      84 |  return smp_load_acquire(&(v)->counter);
         |         ^~~~~~~~~~~~~~~~
>> include/asm-generic/barrier.h:189:14: error: '___p1' undeclared (first u=
se in this function)
     189 |  (typeof(*p))___p1;      \
         |              ^~~~~
   include/linux/atomic-fallback.h:84:9: note: in expansion of macro 'smp_l=
oad_acquire'
      84 |  return smp_load_acquire(&(v)->counter);
         |         ^~~~~~~~~~~~~~~~
   include/asm-generic/barrier.h:189:14: note: each undeclared identifier i=
s reported only once for each function it appears in
     189 |  (typeof(*p))___p1;      \
         |              ^~~~~
   include/linux/atomic-fallback.h:84:9: note: in expansion of macro 'smp_l=
oad_acquire'
      84 |  return smp_load_acquire(&(v)->counter);
         |         ^~~~~~~~~~~~~~~~
   include/linux/atomic-fallback.h: In function 'atomic64_read_acquire':
>> include/asm-generic/barrier.h:186:29: error: expected ';' before '___p1'
     186 |  __unqual_scalar_typeof(*p) ___p1 =3D READ_ONCE(*p);  \
         |                             ^~~~~
   include/linux/atomic-fallback.h:1194:9: note: in expansion of macro 'smp=
_load_acquire'
    1194 |  return smp_load_acquire(&(v)->counter);
         |         ^~~~~~~~~~~~~~~~
>> include/asm-generic/barrier.h:189:14: error: '___p1' undeclared (first u=
se in this function)
     189 |  (typeof(*p))___p1;      \
         |              ^~~~~
   include/linux/atomic-fallback.h:1194:9: note: in expansion of macro 'smp=
_load_acquire'
    1194 |  return smp_load_acquire(&(v)->counter);
         |         ^~~~~~~~~~~~~~~~
   make[2]: *** [scripts/Makefile.build:106: kernel/bounds.s] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1121: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:180: sub-make] Error 2

vim +186 include/asm-generic/barrier.h

   182	=

   183	#ifndef smp_load_acquire
   184	#define smp_load_acquire(p)						\
   185	({									\
 > 186		__unqual_scalar_typeof(*p) ___p1 =3D READ_ONCE(*p);		\
   187		compiletime_assert_atomic_type(*p);				\
   188		barrier();							\
 > 189		(typeof(*p))___p1;						\
   190	})
   191	#endif
   192	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============6012659095324915778==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
6mu7Viv78f8AGffxLRWrAAA=
--===============6012659095324915778==--

