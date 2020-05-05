Content-Type: multipart/mixed; boundary="===============5809797891303690710=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [rppt:pt-cleanups/pXd-consolidation 23/26] arch/powerpc/include/asm/pgtable.h:59:33: error: implicit declaration of function 'pte_offset_kernel'
Date: Tue, 05 May 2020 12:59:52 +0800
Message-ID: <202005051244.1vy5DWf4%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5809797891303690710==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git pt-c=
leanups/pXd-consolidation
head:   3938b8b12f4104fa561dc8148c4547d315af3893
commit: 86640895215c106f24e5284cb55efb258d549d4c [23/26] mm: consolidate pt=
e_index() and pte_offset_*() definitions
config: powerpc-mpc866_ads_defconfig (attached as .config)
compiler: powerpc-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 86640895215c106f24e5284cb55efb258d549d4c
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day GCC_VERSION=3D9.3.0 make.cross A=
RCH=3Dpowerpc =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/pgtable.h:5,
                    from arch/powerpc/include/asm/kup.h:40,
                    from arch/powerpc/include/asm/uaccess.h:9,
                    from include/linux/uaccess.h:11,
                    from include/linux/crypto.h:21,
                    from include/crypto/hash.h:11,
                    from include/linux/uio.h:10,
                    from include/linux/socket.h:8,
                    from include/linux/compat.h:15,
                    from arch/powerpc/kernel/asm-offsets.c:14:
   arch/powerpc/include/asm/pgtable.h: In function 'virt_to_kpte':
>> arch/powerpc/include/asm/pgtable.h:59:33: error: implicit declaration of=
 function 'pte_offset_kernel' [-Werror=3Dimplicit-function-declaration]
      59 |  return pmd_none(*pmd) ? NULL : pte_offset_kernel(pmd, vaddr);
         |                                 ^~~~~~~~~~~~~~~~~
>> arch/powerpc/include/asm/pgtable.h:59:31: warning: pointer/integer type =
mismatch in conditional expression
      59 |  return pmd_none(*pmd) ? NULL : pte_offset_kernel(pmd, vaddr);
         |                               ^
   In file included from arch/powerpc/include/asm/kup.h:40,
                    from arch/powerpc/include/asm/uaccess.h:9,
                    from include/linux/uaccess.h:11,
                    from include/linux/crypto.h:21,
                    from include/crypto/hash.h:11,
                    from include/linux/uio.h:10,
                    from include/linux/socket.h:8,
                    from include/linux/compat.h:15,
                    from arch/powerpc/kernel/asm-offsets.c:14:
   include/linux/pgtable.h: At top level:
>> include/linux/pgtable.h:22:22: error: conflicting types for 'pte_offset_=
kernel'
      22 | static inline pte_t *pte_offset_kernel(pmd_t *pmd, unsigned long=
 address)
         |                      ^~~~~~~~~~~~~~~~~
   In file included from include/linux/pgtable.h:5,
                    from arch/powerpc/include/asm/kup.h:40,
                    from arch/powerpc/include/asm/uaccess.h:9,
                    from include/linux/uaccess.h:11,
                    from include/linux/crypto.h:21,
                    from include/crypto/hash.h:11,
                    from include/linux/uio.h:10,
                    from include/linux/socket.h:8,
                    from include/linux/compat.h:15,
                    from arch/powerpc/kernel/asm-offsets.c:14:
   arch/powerpc/include/asm/pgtable.h:59:33: note: previous implicit declar=
ation of 'pte_offset_kernel' was here
      59 |  return pmd_none(*pmd) ? NULL : pte_offset_kernel(pmd, vaddr);
         |                                 ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
   make[2]: *** [scripts/Makefile.build:100: arch/powerpc/kernel/asm-offset=
s.s] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1141: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:180: sub-make] Error 2

vim +/pte_offset_kernel +59 arch/powerpc/include/asm/pgtable.h

2efc7c085f0587 Christophe Leroy 2020-01-09  54  =

2efc7c085f0587 Christophe Leroy 2020-01-09  55  static inline pte_t *virt_t=
o_kpte(unsigned long vaddr)
2efc7c085f0587 Christophe Leroy 2020-01-09  56  {
cc6f0e39000900 Christophe Leroy 2020-03-07  57  	pmd_t *pmd =3D pmd_ptr_k(v=
addr);
cc6f0e39000900 Christophe Leroy 2020-03-07  58  =

cc6f0e39000900 Christophe Leroy 2020-03-07 @59  	return pmd_none(*pmd) ? NU=
LL : pte_offset_kernel(pmd, vaddr);
2efc7c085f0587 Christophe Leroy 2020-01-09  60  }
0b1c524caaae24 Christophe Leroy 2020-01-09  61  #endif
0b1c524caaae24 Christophe Leroy 2020-01-09  62  =


:::::: The code at line 59 was first introduced by commit
:::::: cc6f0e39000900e5dd1448103a9571f0eccd7d4e powerpc/32: Fix missing NUL=
L pmd check in virt_to_kpte()

:::::: TO: Christophe Leroy <christophe.leroy@c-s.fr>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5809797891303690710==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
vAAA
--===============5809797891303690710==--

