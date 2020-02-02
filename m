Content-Type: multipart/mixed; boundary="===============6812483396397058932=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [rppt:pg_table/v0.0 5/18] arch/powerpc/kernel/asm-offsets.c:361:28: error: 'struct mm_struct' has no member named 'pgd'; did you mean 'pgt'?
Date: Sun, 02 Feb 2020 20:16:46 +0800
Message-ID: <202002021911.1Uqc9X9g%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6812483396397058932==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git pg_t=
able/v0.0
head:   fd150c5a9ef6e3e43818825c69a46de2b427dedf
commit: e5db6ff88e6ef1ff9ab6fefb7ec882d7e329f783 [5/18] mm: move pgd into '=
struct pg_table'
config: powerpc-allnoconfig (attached as .config)
compiler: powerpc-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout e5db6ff88e6ef1ff9ab6fefb7ec882d7e329f783
        # save the attached .config to linux build tree
        GCC_VERSION=3D7.5.0 make.cross ARCH=3Dpowerpc =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from arch/powerpc/kernel/asm-offsets.c:29:0:
   arch/powerpc/kernel/asm-offsets.c: In function 'main':
>> arch/powerpc/kernel/asm-offsets.c:361:28: error: 'struct mm_struct' has =
no member named 'pgd'; did you mean 'pgt'?
     OFFSET(MM_PGD, mm_struct, pgd);
                               ^
   include/linux/kbuild.h:6:62: note: in definition of macro 'DEFINE'
     asm volatile("\n.ascii \"->" #sym " %0 " #val "\"" : : "i" (val))
                                                                 ^~~
>> include/linux/stddef.h:17:32: note: in expansion of macro '__compiler_of=
fsetof'
    #define offsetof(TYPE, MEMBER) __compiler_offsetof(TYPE, MEMBER)
                                   ^~~~~~~~~~~~~~~~~~~
>> include/linux/kbuild.h:11:14: note: in expansion of macro 'offsetof'
     DEFINE(sym, offsetof(struct str, mem))
                 ^~~~~~~~
>> arch/powerpc/kernel/asm-offsets.c:361:2: note: in expansion of macro 'OF=
FSET'
     OFFSET(MM_PGD, mm_struct, pgd);
     ^~~~~~
   make[2]: *** [arch/powerpc/kernel/asm-offsets.s] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [sub-make] Error 2
   9 real  3 user  5 sys  95.89% cpu 	make prepare

vim +361 arch/powerpc/kernel/asm-offsets.c

d1dead5c5f016e Stephen Rothwell 2005-09-29  359  =

d1dead5c5f016e Stephen Rothwell 2005-09-29  360  #ifndef CONFIG_PPC64
45465615511060 Rashmica Gupta   2017-02-15 @361  	OFFSET(MM_PGD, mm_struct,=
 pgd);
d1dead5c5f016e Stephen Rothwell 2005-09-29  362  #endif /* ! CONFIG_PPC64 */
14cf11af6cf608 Paul Mackerras   2005-09-26  363  =

14cf11af6cf608 Paul Mackerras   2005-09-26  364  	/* About the CPU features=
 table */
45465615511060 Rashmica Gupta   2017-02-15  365  	OFFSET(CPU_SPEC_FEATURES,=
 cpu_spec, cpu_features);
45465615511060 Rashmica Gupta   2017-02-15  366  	OFFSET(CPU_SPEC_SETUP, cp=
u_spec, cpu_setup);
45465615511060 Rashmica Gupta   2017-02-15  367  	OFFSET(CPU_SPEC_RESTORE, =
cpu_spec, cpu_restore);
14cf11af6cf608 Paul Mackerras   2005-09-26  368  =

45465615511060 Rashmica Gupta   2017-02-15  369  	OFFSET(pbe_address, pbe, =
address);
45465615511060 Rashmica Gupta   2017-02-15  370  	OFFSET(pbe_orig_address, =
pbe, orig_address);
45465615511060 Rashmica Gupta   2017-02-15  371  	OFFSET(pbe_next, pbe, nex=
t);
14cf11af6cf608 Paul Mackerras   2005-09-26  372  =


:::::: The code at line 361 was first introduced by commit
:::::: 454656155110603e88b83eec847d5293a30bb96e powerpc/asm: Use OFFSET mac=
ro in asm-offsets.c

:::::: TO: Rashmica Gupta <rashmicy@gmail.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation

--===============6812483396397058932==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============6812483396397058932==--

