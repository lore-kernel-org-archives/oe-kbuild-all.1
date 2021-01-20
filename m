Content-Type: multipart/mixed; boundary="===============4832813000404729584=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [norov:find_bit_static 8/8] include/asm-generic/bitops/le.h:49:13: error: implicit declaration of function 'swap'; did you mean
Date: Wed, 20 Jan 2021 13:37:06 +0800
Message-ID: <202101201357.HOqgcyIg-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4832813000404729584==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/norov/linux find_bit_static
head:   9647d9f4cd1b259c620e06337010396d5a324f79
commit: 9647d9f4cd1b259c620e06337010396d5a324f79 [8/8] fix next
config: powerpc-iss476-smp_defconfig (attached as .config)
compiler: powerpc-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/norov/linux/commit/9647d9f4cd1b259c620e0633701=
0396d5a324f79
        git remote add norov https://github.com/norov/linux
        git fetch --no-tags norov find_bit_static
        git checkout 9647d9f4cd1b259c620e06337010396d5a324f79
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Dpowerpc =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/include/asm/bitops.h:265,
                    from include/linux/bitops.h:50,
                    from include/linux/kernel.h:11,
                    from include/asm-generic/bug.h:20,
                    from arch/powerpc/include/asm/bug.h:109,
                    from include/linux/bug.h:5,
                    from include/linux/page-flags.h:10,
                    from kernel/bounds.c:10:
   include/asm-generic/bitops/le.h: In function 'find_next_zero_bit_le':
   include/asm-generic/bitops/le.h:45:9: warning: dereferencing 'void *' po=
inter
      45 |   val =3D *addr | ~BITMAP_FIRST_WORD_MASK(offset);
         |         ^~~~~
   include/asm-generic/bitops/le.h:45:9: error: void value not ignored as i=
t ought to be
   In file included from arch/powerpc/include/asm/bitops.h:207,
                    from include/linux/bitops.h:50,
                    from include/linux/kernel.h:11,
                    from include/asm-generic/bug.h:20,
                    from arch/powerpc/include/asm/bug.h:109,
                    from include/linux/bug.h:5,
                    from include/linux/page-flags.h:10,
                    from kernel/bounds.c:10:
>> include/asm-generic/bitops/le.h:49:13: error: implicit declaration of fu=
nction 'swap'; did you mean 'swab'? [-Werror=3Dimplicit-function-declaratio=
n]
      49 |   idx =3D ffz(swap(val));
         |             ^~~~
   include/asm-generic/bitops/ffz.h:11:25: note: in definition of macro 'ff=
z'
      11 | #define ffz(x)  __ffs(~(x))
         |                         ^
   In file included from arch/powerpc/include/asm/bitops.h:265,
                    from include/linux/bitops.h:50,
                    from include/linux/kernel.h:11,
                    from include/asm-generic/bug.h:20,
                    from arch/powerpc/include/asm/bug.h:109,
                    from include/linux/bug.h:5,
                    from include/linux/page-flags.h:10,
                    from kernel/bounds.c:10:
   include/asm-generic/bitops/le.h: In function 'find_next_bit_le':
   include/asm-generic/bitops/le.h:69:9: warning: dereferencing 'void *' po=
inter
      69 |   val =3D *addr & BITMAP_FIRST_WORD_MASK(offset)
         |         ^~~~~
   include/asm-generic/bitops/le.h:69:9: error: void value not ignored as i=
t ought to be
   cc1: some warnings being treated as errors
--
   In file included from arch/powerpc/include/asm/bitops.h:265,
                    from include/linux/bitops.h:50,
                    from include/linux/kernel.h:11,
                    from include/asm-generic/bug.h:20,
                    from arch/powerpc/include/asm/bug.h:109,
                    from include/linux/bug.h:5,
                    from include/linux/page-flags.h:10,
                    from kernel/bounds.c:10:
   include/asm-generic/bitops/le.h: In function 'find_next_zero_bit_le':
   include/asm-generic/bitops/le.h:45:9: warning: dereferencing 'void *' po=
inter
      45 |   val =3D *addr | ~BITMAP_FIRST_WORD_MASK(offset);
         |         ^~~~~
   include/asm-generic/bitops/le.h:45:9: error: void value not ignored as i=
t ought to be
   In file included from arch/powerpc/include/asm/bitops.h:207,
                    from include/linux/bitops.h:50,
                    from include/linux/kernel.h:11,
                    from include/asm-generic/bug.h:20,
                    from arch/powerpc/include/asm/bug.h:109,
                    from include/linux/bug.h:5,
                    from include/linux/page-flags.h:10,
                    from kernel/bounds.c:10:
>> include/asm-generic/bitops/le.h:49:13: error: implicit declaration of fu=
nction 'swap'; did you mean 'swab'? [-Werror=3Dimplicit-function-declaratio=
n]
      49 |   idx =3D ffz(swap(val));
         |             ^~~~
   include/asm-generic/bitops/ffz.h:11:25: note: in definition of macro 'ff=
z'
      11 | #define ffz(x)  __ffs(~(x))
         |                         ^
   In file included from arch/powerpc/include/asm/bitops.h:265,
                    from include/linux/bitops.h:50,
                    from include/linux/kernel.h:11,
                    from include/asm-generic/bug.h:20,
                    from arch/powerpc/include/asm/bug.h:109,
                    from include/linux/bug.h:5,
                    from include/linux/page-flags.h:10,
                    from kernel/bounds.c:10:
   include/asm-generic/bitops/le.h: In function 'find_next_bit_le':
   include/asm-generic/bitops/le.h:69:9: warning: dereferencing 'void *' po=
inter
      69 |   val =3D *addr & BITMAP_FIRST_WORD_MASK(offset)
         |         ^~~~~
   include/asm-generic/bitops/le.h:69:9: error: void value not ignored as i=
t ought to be
   cc1: some warnings being treated as errors
   make[2]: *** [scripts/Makefile.build:117: kernel/bounds.s] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1220: prepare0] Error 2
   make[1]: Target 'modules_prepare' not remade because of errors.
   make: *** [Makefile:185: __sub-make] Error 2
   make: Target 'modules_prepare' not remade because of errors.
--
   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on SMP && (PPC_PSERIES || PPC_PMAC || PPC_POWERNV || FSL_SOC_BOO=
KE
   Selected by
   - PM_SLEEP_SMP && SMP && (ARCH_SUSPEND_POSSIBLE || ARCH_HIBERNATION_POSS=
IBLE && PM_SLEEP
   In file included from arch/powerpc/include/asm/bitops.h:265,
   from include/linux/bitops.h:50,
   from include/linux/kernel.h:11,
   from include/asm-generic/bug.h:20,
   from arch/powerpc/include/asm/bug.h:109,
   from include/linux/bug.h:5,
   from include/linux/page-flags.h:10,
   from kernel/bounds.c:10:
   include/asm-generic/bitops/le.h: In function 'find_next_zero_bit_le':
   include/asm-generic/bitops/le.h:45:9: warning: dereferencing 'void point=
er
   45 | val =3D | ~BITMAP_FIRST_WORD_MASK(offset);
   | ^~~~~
   include/asm-generic/bitops/le.h:45:9: error: void value not ignored as i=
t ought to be
   In file included from arch/powerpc/include/asm/bitops.h:207,
   from include/linux/bitops.h:50,
   from include/linux/kernel.h:11,
   from include/asm-generic/bug.h:20,
   from arch/powerpc/include/asm/bug.h:109,
   from include/linux/bug.h:5,
   from include/linux/page-flags.h:10,
   from kernel/bounds.c:10:
>> include/asm-generic/bitops/le.h:49:13: error: implicit declaration of fu=
nction 'swap'; did you mean
   49 | idx =3D ffz(swap(val));
   | ^~~~
   include/asm-generic/bitops/ffz.h:11:25: note: in definition of macro 'ff=
z'
   11 | #define ffz(x) __ffs(~(x))
   | ^
   In file included from arch/powerpc/include/asm/bitops.h:265,
   from include/linux/bitops.h:50,
   from include/linux/kernel.h:11,
   from include/asm-generic/bug.h:20,
   from arch/powerpc/include/asm/bug.h:109,
   from include/linux/bug.h:5,
   from include/linux/page-flags.h:10,
   from kernel/bounds.c:10:
   include/asm-generic/bitops/le.h: In function 'find_next_bit_le':
   include/asm-generic/bitops/le.h:69:9: warning: dereferencing 'void point=
er
   69 | val =3D & BITMAP_FIRST_WORD_MASK(offset)
   | ^~~~~
   include/asm-generic/bitops/le.h:69:9: error: void value not ignored as i=
t ought to be
   cc1: some warnings being treated as errors
   Makefile arch block certs crypto drivers fs include init ipc kernel lib =
mm net scripts security sound source usr virt [scripts/Makefile.build:117: =
kernel/bounds.s] Error 1
   Target '__build' not remade because of errors.
   Makefile arch block certs crypto drivers fs include init ipc kernel lib =
mm net scripts security sound source usr virt [Makefile:1220: prepare0] Err=
or 2
   Target 'prepare' not remade because of errors.
   make: Makefile arch block certs crypto drivers fs include init ipc kerne=
l lib mm net scripts security sound source usr virt [Makefile:185: __sub-ma=
ke] Error 2
   make: Target 'prepare' not remade because of errors.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on SMP && (PPC_PSERIES || PPC_PMAC || PPC_POWERNV || FSL_SOC_BOO=
KE
   Selected by
   - PM_SLEEP_SMP && SMP && (ARCH_SUSPEND_POSSIBLE || ARCH_HIBERNATION_POSS=
IBLE && PM_SLEEP


vim +/swap +49 include/asm-generic/bitops/le.h

    33	=

    34	#ifndef find_next_zero_bit_le
    35	static __always_inline
    36	unsigned long find_next_zero_bit_le(const void *addr, unsigned
    37			long size, unsigned long offset)
    38	{
    39		if (small_const_nbits(size)) {
    40			unsigned long val, idx;
    41	=

    42			if (unlikely(offset >=3D size))
    43				return size;
    44	=

    45			val =3D *addr | ~BITMAP_FIRST_WORD_MASK(offset);
    46			if (val =3D=3D ~0UL)
    47				return size;
    48	=

  > 49			idx =3D ffz(swap(val));
    50	=

    51			return idx < size ? idx : size;
    52		}
    53	=

    54		return _find_next_bit(addr, NULL, size, offset, ~0UL, 1);
    55	}
    56	#endif
    57	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--===============4832813000404729584==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============4832813000404729584==--

